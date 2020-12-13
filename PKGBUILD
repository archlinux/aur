# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=shotman
pkgver=0.1.3
pkgrel=1
pkgdesc="Simple, light, modern tool for screenshooting."
arch=('any')
url="https://gitlab.com/whynothugo/shotman"
license=('ISC')
depends=('pyside6' 'grimshot' 'qt6-wayland' 'qt6-svg')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('a76c4f4d1b9e5786b559c33781cc8bebcbaf4a8b07a4c50cff8e91620442aadd586b355b12e4f01579dc5745c08e6dd09b1b23bf51dc53d7b88701e45542ecee')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}"

  # TODO: manpages

  install -vDm 644 LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"
}
