# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# ex-Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=warp
pkgver=0.2.0
pkgrel=1
pkgdesc="Fast and secure file transfer"
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/World/warp"
license=('GPL3')
depends=('libadwaita' 'magic-wormhole')
makedepends=('meson' 'cargo' 'itstool')
checkdepends=('appstream-glib')
conflicts=("$pkgname-share-files")
replaces=("$pkgname-share-files")
source=($url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
b2sums=('18847bf39885d65b5a1afa72fb5bdd9e1d0c790c6f9b30b31aa273a271be115c891742b5447a4aaed5dc0885a6fc69d0461fb3d99baad1bab3f07d219ed5eec5')
 
build() {
  arch-meson "$pkgname-v$pkgver" build
  meson compile -C build
}
 
check() {
  meson test -C build || :
}
 
package() {
  meson install -C build --destdir "$pkgdir"
}
