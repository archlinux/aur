# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# ex-Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=warp
pkgver=0.1.2
pkgrel=3
pkgdesc="Fast and secure file transfer"
arch=('x86_64')
url="https://gitlab.gnome.org/World/warp"
license=('GPL3')
depends=('libadwaita' 'magic-wormhole')
makedepends=('meson' 'rust' 'itstool')
checkdepends=('appstream-glib')
conflicts=("$pkgname-share-files")
replaces=("$pkgname-share-files")
source=($url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
b2sums=('d15be85c96bb94f235fef0176c4ac6262a30d6bac890bc95c617de9b4f9c566adf988e35912d6db7674b8acd0386fbb565cb7cdd898bc60cdb34691725412539')
 
build() {
  arch-meson "$pkgname-v$pkgver" build
  meson compile -C build
}
 
check() {
  meson test -C build
}
 
package() {
  meson install -C build --destdir "$pkgdir"
}
