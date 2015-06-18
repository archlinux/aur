# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=ropper-git
pkgver=1.5.2.122.d950ffd
pkgrel=1
pkgdesc="Show information about binary files and find gadgets to build rop chains for different architectures"
arch=('any')
url="https://github.com/sashs/Ropper"
license=('GPL2')
depends=('python-capstone' 'sqlite')
makedepends=('git' 'python-setuptools')
provides=('ropper')
conflicts=('ropper')
source=(${pkgname}::git+https://github.com/sashs/Ropper)
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "%s.%s.%s" "$(python setup.py --version)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${pkgname}
  python setup.py build
}

package() {
  cd ${pkgname}
  python setup.py install -O1 --root="${pkgdir}"
  install -Dm 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim:set ts=2 sw=2 et:
