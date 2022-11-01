# Maintainer: TommyTran732 <contact@tommytran.io>
# Contributor: Frederic Bezies <fredbezies@gmail.com>, Cassandra Watergate (saltedcoffii) <cassandrajwatergate@gmail.com>, LSUtigers3131

pkgname=libpamac-flatpak
_pkgname=libpamac
pkgver=11.4.1
pkgrel=1
pkgdesc="Library for Pamac package manager based on libalpm - flatpak and support enabled"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://gitlab.manjaro.org/applications/libpamac"
license=('GPL3')
depends=('pacman>=6.0' 'pacman<6.1' 'flatpak' 'archlinux-appstream-data-pamac')
makedepends=('gettext' 'itstool' 'vala' 'meson' 'gobject-introspection' 'xorgproto' 'asciidoc')
options=(!emptydirs)
conflicts=('libpamac' 'libpamac-aur' 'libpamac-full' 'libpamac-full-dev' 'libpamac-nosnap')
source=(https://gitlab.manjaro.org/applications/libpamac/-/archive/$pkgver/libpamac-$pkgver.tar.bz2)
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
