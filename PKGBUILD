# Maintainer: Cassandra Watergate (saltedcoffii) <cassandrawatergate@outlook.com>
# Contributer: LSUtigers3131

_pkgname=libpamac
pkgname=$_pkgname-nosnap
pkgver=11.3.0
pkgrel=1
epoch=1
pkgdesc="Library for Pamac package manager based on libalpm - flatpak support enabled"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://gitlab.manjaro.org/applications/libpamac"
license=('GPL3')
depends=('pacman' 'flatpak' 'archlinux-appstream-data-pamac')
makedepends=('gettext' 'itstool' 'vala' 'meson' 'gobject-introspection' 'xorgproto' 'asciidoc')
options=(!emptydirs)
conflicts=('libpamac-aur' 'libpamac-flatpak' 'libpamac' 'libpamac-full-dev' 'libpamac-full')
source=($_pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/$_pkgname-$pkgver.tar.bz2)
sha512sums=('1f1e2b7925b704481bfa1d2a1dbd5677a4cd58eabd6147b8b8b3f78ef564a802082f3097fc36a955cbec2b179f3b4acee1600a9359916a93886a335d5db1ac5c')

build() {
  arch-meson -Denable-flatpak=true -Denable-snap=false --buildtype=release $_pkgname-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  backup=('etc/pamac.conf')
  meson install -C build --destdir "$pkgdir"
}
