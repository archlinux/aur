# Maintainer:  jyantis <yantis@yantis.net>

pkgname=python2-nameparser
pkgver=v0.3.3
pkgrel=1
pkgdesc='A simple Python 2 module for parsing human names into their individual components'
arch=('any')
url='https://github.com/derek73/python-nameparser'
license=('custom')
depends=('python2')
source=('https://pypi.python.org/packages/source/n/nameparser/nameparser-0.3.3.tar.gz')
md5sums=('eee37936846c38781b00654e59f6e372')
makedepends=('python2-setuptools')
provides=('python2-nameparser')
conflicts=('python2-nameparser')

build() {
  cd nameparser-0.3.3

  # Patch any #!/usr/bin/python to #!/usr/bin/python2
  for file in $(find . -name '*.py' -print); do
    sed -r -i 's_^#!.*/usr/bin/python(\s|$)_#!/usr/bin/python2_' $file
    sed -r -i 's_^#!.*/usr/bin/env(\s)*python(\s|$)_#!/usr/bin/env python2_' $file
  done

  python2 setup.py build
}

check() {
  cd nameparser-0.3.3
  python2 setup.py test --verbose
}

package() {
  cd nameparser-0.3.3

  python2 setup.py install --root="${pkgdir}" --optimize=1

  # Install License
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}

# vim:set ts=2 sw=2 et:
