# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=protonplus
pkgver=0.2.0
pkgrel=1
pkgdesc="A simple proton version manager"
arch=('x86_64')
url="https://github.com/Vysp3r/ProtonPlus"
license=('GPL3')
depends=('json-glib' 'libadwaita' 'libarchive' 'libsoup3')
makedepends=('meson' 'vala')
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ec1e818ad768e1cda6906de8225d56f980e59a18265b511d73f22e87e2448175')

prepare() {
  cd "ProtonPlus-$pkgver"

  # Correct desktop file category
  sed -i 's/Games;/Game;/g' data/com.vysp3r.ProtonPlus.desktop.in
}

build() {
  arch-meson "ProtonPlus-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
