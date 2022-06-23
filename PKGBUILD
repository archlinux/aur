# Maintainer: Cassandra Watergate (saltedcoffii) <cassandrawatergate@outlook.com>
# Contributer: LSUtigers3131

_pkgname=libpamac
pkgname=$_pkgname-nosnap
pkgver=11.3.1
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
source=($_pkgname-$pkgver.tar.bz2::$url/-/archive/$pkgver/$_pkgname-$pkgver.tar.bz2)
sha512sums=('2270cacb9d8effca68bf985da96b7160f635f2c8d7d1c584d5d1059a966134fd8499c90e21ac01f07e9f7152bf8c090841545a3b693068a2b84bd53f348ab4ef')

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
