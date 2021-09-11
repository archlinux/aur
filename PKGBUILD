# Maintainer: Patrick Kurth <p.kurth@posteo.de>

pkgname=docma-git
pkgver=r19.b956694
pkgrel=1
pkgdesc="A command-line document manager with keyword search"
arch=('any')
url="https://github.com/patrickschulz/docma"
source=("git+https://github.com/patrickschulz/docma")
sha256sums=('SKIP')
depends=('lua-penlight' 'lua')
makedepends=('git')
conflicts=('docma')
provides=('docma')
license=('custom:unknown')

pkgver() {
  cd ${pkgname%-git}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${pkgname%-git}
  install -d "$pkgdir"/usr/share/lua/5.4
  cp --recursive docmalib "${pkgdir}/usr/share/lua/5.4"
  install -Dm755 ${pkgname%-git} "$pkgdir"/usr/bin/${pkgname%-git}
  touch L
  install -Dm644 L "$pkgdir"/usr/share/licenses/$pkgname/unknown-license
}
