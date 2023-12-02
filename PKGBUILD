# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: LSUtigers3131 
# Contributor: Luke Short <ekultails at gmail dot com>

pkgname=libpamac-full
_pkgname=libpamac
pkgver=11.6.3
pkgrel=1
epoch=1
pkgdesc='Library for Pamac package manager based on libalpm - flatpak and snap support enabled'
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://gitlab.manjaro.org/applications/libpamac"
license=('GPL3')
depends=('pacman>=6.0' 'pacman<6.1' 'flatpak' 'snapd' 'snapd-glib' 'archlinux-appstream-data' 'appstream')
makedepends=('gettext' 'vala' 'meson' 'ninja' 'gobject-introspection' 'git')
options=(!emptydirs)
provides=($_pkgname)
conflicts=('libpamac-aur' 'libpamac-flatpak' $_pkgname 'libpamac-full-dev')
source=("https://gitlab.manjaro.org/applications/libpamac/-/archive/$pkgver/$_pkgname-$pkgver.tar.bz2")
sha256sums=('f8f27b8427e421c24b3a6bfb5792a37abe9cf60fe25c3f6e6dba5c66198a497a')
install='pamac.install'

_srcdir="$_pkgname-$pkgver"

build() {
	arch-meson "$_srcdir" 'build' -Denable-snap=true -Denable-flatpak=true
	meson compile -C 'build'
}

package() {
	backup=('etc/pamac.conf')
	meson install -C 'build' --destdir="$pkgdir"
	install -Dm644 "$_srcdir/COPYING" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
