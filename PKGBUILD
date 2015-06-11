# Maintainer:  jyantis <yantis@yantis.net>

pkgname=python-autopep8-git
pkgver=1.2a0r2182.429bfd4
pkgrel=2
pkgdesc='Automatically formats Python code to conform to the PEP 8 style guide.'
arch=('any')
url='https://github.com/hhatto/autopep8'
license=('MIT')
depends=('python' 'pep8')
source=('git+https://github.com/hhatto/autopep8.git')
sha256sums=('SKIP')
makedepends=('git')
provides=('python-autopep8')
conflicts=('python-autopep8')

pkgver() {
  cd autopep8

  # Pull the version tag from the file
  printf "%s" "$(grep -R "__version__ =" autopep8.py | awk -F\' '{print $2}')"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
  cd autopep8
  python setup.py test --verbose
}

build() {
  cd autopep8
  python setup.py build
}

package() {
  cd autopep8
  python setup.py install --root="${pkgdir}" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
