# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=ropper-git
pkgver=1.9.1.363.ee7d392
pkgrel=1
pkgdesc="Show information about binary files and find gadgets to build rop chains for different architectures"
url="https://github.com/sashs/Ropper"
arch=('any')
license=('GPL2')
depends=('python-capstone' 'python-filebytes')
optdepends=('sqlite: gadgets database support'
            'python-keystone: assemble command support')
makedepends=('git' 'python-setuptools')
checkdepends=('sqlite')
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

check() {
  cd ${pkgname}
  python test.py
}

package() {
  cd ${pkgname}
  python setup.py install -O1 --root="${pkgdir}"
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm 644 sample.py "${pkgdir}/usr/share/doc/${pkgname}/sample.py"
}

# vim: ts=2 sw=2 et:
