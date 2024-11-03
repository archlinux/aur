# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>
# Contributer: TommyTran732 <contact@tommytran.io>
# Contributer: Cassandra Watergate (saltedcoffii) <cassandrajwatergate@gmail.com>
# Contributer: LSUtigers3131

_pkgname=libpamac
pkgname=$_pkgname-flatpak
pkgver=11.7.0
pkgrel=1
epoch=1
_srcdir="$_pkgname-$pkgver"
pkgdesc="Pamac package manager library based on libalpm. With Flatpak support"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
#url="https://gitlab.manjaro.org/applications/libpamac"
url="https://github.com/manjaro/libpamac"
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
    'libpamac-nosnap'
)
options=(!emptydirs !strip)
backup=('etc/pamac.conf')
install='pamac.install'
source=($_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('f63658f93f7ba70932290d5813474f6f59b981c8510848ce6dc5c19004285586')

build() {
	arch-meson "$_srcdir" 'build' -Denable-snap=false -Denable-flatpak=true -Denable-aur=true -Denable-appstream=true
	meson compile -C 'build'
}

package() {
	meson install -C 'build' --destdir="$pkgdir"
	install -Dm644 "$_srcdir/COPYING" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
