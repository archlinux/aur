# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>
# Contributer: Cassandra Watergate (saltedcoffii) <cassandrajwatergate@gmail.com>
# Contributer: LSUtigers3131

_pkgname=libpamac
pkgname=$_pkgname-nosnap
pkgver=11.6.2
pkgrel=1
epoch=1
_srcdir="$_pkgname-$pkgver"
pkgdesc="Pamac package manager library based on libalpm. Without Snap support"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://gitlab.manjaro.org/applications/libpamac"
license=('GPL3')
depends=(
    'appstream-glib'
    'archlinux-appstream-data'
    'dbus-glib'
    'flatpak'
    'git'
    'glib2'
    'gnutls'
    'json-glib'
    'libnotify'
    'libsoup3'
    'pacman'
    'polkit'
    'vte3'    
)
makedepends=(
    'asciidoc'
    'gettext'
    'gobject-introspection'
    'intltool'
    'meson'
    'ninja'
    'vala'
)
provides=('libpamac')
conflicts=(
    'libpamac'
    'libpamac-aur'
    'libpamac-full'
    'libpamac-flatpak'
)
options=(!emptydirs !strip)
backup=('etc/pamac.conf')
install='pamac.install'
source=($_pkgname-$pkgver.tar.bz2::$url/-/archive/$pkgver/$_pkgname-$pkgver.tar.bz2)
sha256sums=('87c5ed7f7db615628e8e4e151be3ef6d328513c02cd1aaf102b8577cb7269987')

build() {
	arch-meson "$_srcdir" 'build' -Denable-snap=false -Denable-flatpak=true
	meson compile -C 'build'
}

package() {
	meson install -C 'build' --destdir="$pkgdir"
	install -Dm644 "$_srcdir/COPYING" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
