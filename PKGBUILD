# Maintainer: Cassandra Watergate (saltedcoffii) <cassandrajwatergate@gmail.com>
# Contributer: LSUtigers3131

_pkgname=libpamac
pkgname=$_pkgname-nosnap
pkgver=11.5.4
pkgrel=1
epoch=1
pkgdesc="Library for Pamac package manager based on libalpm - flatpak support enabled"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://gitlab.manjaro.org/applications/libpamac"
license=('GPL3')
depends=('pacman' 'flatpak' 'appstream-glib' 'archlinux-appstream-data')
makedepends=('gettext' 'itstool' 'vala' 'meson' 'gobject-introspection' 'xorgproto' 'asciidoc')
options=(!emptydirs)
conflicts=('libpamac-aur' 'libpamac-flatpak' 'libpamac' 'libpamac-full-dev' 'libpamac-full')
source=($_pkgname-$pkgver.tar.bz2::$url/-/archive/$pkgver/$_pkgname-$pkgver.tar.bz2)
sha512sums=('ed0ec2ae781502efc87c870d6c9612799c3a693e287a3c6bb04aa0d1cc0d70cae8d276812aa3c3d9adf6cdd72e0f63f9384d7cafd467ba126491267029ff5c9c')

build() {
  arch-meson -Denable-flatpak=true -Denable-snap=false $_pkgname-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  backup=('etc/pamac.conf')
  meson install -C build --destdir "$pkgdir"
}
