# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# ex-Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=warp
pkgver=0.2.3
pkgrel=1
pkgdesc="Fast and secure file transfer"
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/World/warp"
license=('GPL3')
depends=('libadwaita')
makedepends=('meson' 'cargo' 'itstool')
checkdepends=('appstream-glib')
conflicts=("$pkgname-share-files")
replaces=("$pkgname-share-files")
source=($url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
b2sums=('2102b34b4a39dc5c7c9782e976e8a040e8d2b325503cff34e393334c92b58d1f70f61768785d1f802bb371749616f8e099379a1d4f369c0cee0a9dbf0fb0823e')
 
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
