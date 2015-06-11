# Maintainer:  jyantis <yantis@yantis.net>

pkgname=python-nameparser
pkgver=v0.3.3
pkgrel=1
pkgdesc='A simple Python 2 module for parsing human names into their individual components'
arch=('any')
url='https://github.com/derek73/python-nameparser'
license=('custom')
depends=('python')
source=('https://pypi.python.org/packages/source/n/nameparser/nameparser-0.3.3.tar.gz')
md5sums=('eee37936846c38781b00654e59f6e372')
makedepends=('python-setuptools')
provides=('python-nameparser')
conflicts=('python-nameparser')

build() {
  cd nameparser-0.3.3

  # Patch any #!/usr/bin/python to #!/usr/bin/python
  for file in $(find . -name '*.py' -print); do
    sed -r -i 's_^#!.*/usr/bin/python(\s|$)_#!/usr/bin/python_' $file
    sed -r -i 's_^#!.*/usr/bin/env(\s)*python(\s|$)_#!/usr/bin/env python_' $file
  done

  python setup.py build
}

check() {
  cd nameparser-0.3.3
  python setup.py test --verbose
}

package() {
  cd nameparser-0.3.3

  python setup.py install --root="${pkgdir}" --optimize=1

  # Install License
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}

# vim:set ts=2 sw=2 et:
