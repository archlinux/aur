# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=protonplus
pkgver=0.2.3
pkgrel=1
pkgdesc="A simple proton version manager"
arch=('x86_64')
url="https://github.com/Vysp3r/ProtonPlus"
license=('GPL3')
depends=('json-glib' 'libadwaita' 'libarchive' 'libsoup3')
makedepends=('meson' 'vala')
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('22f3aa207dffe97b5d9c0ec2db5a3e245842d60a67373539496cbb4e34a5ecb9')

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
