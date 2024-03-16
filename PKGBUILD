# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>
# Contributer: Cassandra Watergate (saltedcoffii) <cassandrajwatergate@gmail.com>
# Contributer: LSUtigers3131

_pkgname=libpamac
pkgname=$_pkgname-nosnap
pkgver=11.6.4
pkgrel=1
epoch=1
_srcdir="$_pkgname-$pkgver"
#_srcdir="$_pkgname"
pkgdesc="Pamac package manager library based on libalpm. Without Snap support"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://gitlab.manjaro.org/applications/libpamac"
license=('GPL3')
depends=(
    'appstream-glib'
    'archlinux-appstream-data'
    'dbus-glib'
    'flatpak'
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
    'git'
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
sha256sums=('4ac54679e25004d6af8154340bac2e060c3a109a6bcb336f54ce025b2d68f080')
#source=(
#    "git+https://gitlab.manjaro.org/applications/libpamac.git#commit=e74fe0e1c15f4fd14d02ff12650be3fde47287d7"
#    "${pkgname}-appstream-1.0.patch"    
#)
#sha256sums=(
#    'SKIP'
#    '23beff3d0bc9e1bf30b3ab45910faeb89125c392d9b95d6de83020ac88698851'
#)

#prepare() {
#	cd "$_srcdir"
#	patch -p1 -i "${srcdir}/${pkgname}-appstream-1.0.patch"
#}

build() {
	arch-meson "$_srcdir" 'build' -Denable-snap=false -Denable-flatpak=true -Denable-aur=true -Denable-appstream=true
	meson compile -C 'build'
}

package() {
	meson install -C 'build' --destdir="$pkgdir"
	install -Dm644 "$_srcdir/COPYING" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
