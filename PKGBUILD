# Maintainer: Mazhar Hussain <realmazharhussain@gmail.com>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
pkgname=daikhan
pkgver=0.1_alpha7
_pkgver=${pkgver/_/-}
pkgrel=1
pkgdesc="A media player for the modern desktop"
arch=('x86_64')
url="https://gitlab.com/daikhan/daikhan"
license=('GPL-3.0-or-later')
depends=('gst-plugin-gtk4' 'libadwaita' 'xxhash')
makedepends=('blueprint-compiler' 'meson' 'vala')
checkdepends=('appstream')
optdepends=(
  'libclapper-gtk: improved color accuracy'
)
source=("https://gitlab.com/daikhan/$pkgname/-/archive/$_pkgver/$pkgname-$_pkgver.tar.bz2")
sha256sums=('4ce436e49f46d8d21d8684603291070be99628e5e8621da7427269e07321653b')

build() {
  arch-meson -Dprofile=stable "$pkgname-$_pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
