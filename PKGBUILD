# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: LSUtigers3131 
# Contributor: Luke Short <ekultails at gmail dot com>

pkgname=libpamac-full
_pkgname=libpamac
pkgver=11.5.4
pkgrel=2
epoch=1
pkgdesc="Library for Pamac package manager based on libalpm - flatpak and snap support enabled"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://gitlab.manjaro.org/applications/libpamac"
license=('GPL3')
depends=('pacman>=6.0' 'pacman<6.1' 'flatpak' 'snapd' 'snapd-glib' 'archlinux-appstream-data' 'appstream-glib')
makedepends=('gettext' 'vala' 'meson' 'ninja' 'gobject-introspection')
options=(!emptydirs)
provides=("$_pkgname")
conflicts=('libpamac-aur' 'libpamac-flatpak' 'libpamac' 'libpamac-full-dev')
source=("https://gitlab.manjaro.org/applications/libpamac/-/archive/$pkgver/$_pkgname-$pkgver.tar.bz2")
sha256sums=('7502224dffed962ed0cfe6b1d917f89065d727d7e6f5f3fc60c8e068b3d0bff2')
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

#vim:set ts=2 sw=2 et:
