# Maintainer: Cassandra Watergate (saltedcoffii) <cassandrajwatergate@gmail.com>
# Contributer: LSUtigers3131

_pkgname=libpamac
pkgname=$_pkgname-nosnap
pkgver=11.4.1
pkgrel=2
epoch=1
pkgdesc="Library for Pamac package manager based on libalpm - flatpak support enabled"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://gitlab.manjaro.org/applications/libpamac"
license=('GPL3')
depends=('pacman' 'flatpak' 'appstream-glib' 'archlinux-appstream-data-pamac')
makedepends=('gettext' 'itstool' 'vala' 'meson' 'gobject-introspection' 'xorgproto' 'asciidoc')
options=(!emptydirs)
conflicts=('libpamac-aur' 'libpamac-flatpak' 'libpamac' 'libpamac-full-dev' 'libpamac-full')
source=($_pkgname-$pkgver.tar.bz2::$url/-/archive/$pkgver/$_pkgname-$pkgver.tar.bz2)
sha512sums=('db81375cfb2c7a4939b324c5ed62f59f759f8d0ac957c4af5cb629a33613ad82b5d820cab9300d3ba634e082db13f6edef4663f18d010e763880e3dcb6c7fed8')

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
