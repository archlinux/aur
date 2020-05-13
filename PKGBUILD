# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
# Contributor: Davide Depau <davide@depau.eu>
_pkgname="obs-xdg-portal"
pkgname="${_pkgname}-git"
pkgver=0.1.2.r0.gfc5876a
pkgrel=1
pkgdesc="OBS Studio plugin using the Desktop portal for Wayland & X11 screencasting"
arch=(x86_64)
url="https://gitlab.gnome.org/feaneron/$_pkgname"
license=('GPL')
depends=('obs-studio' 'gst-plugins-base-libs' 'xdg-desktop-portal')
makedepends=('meson' 'git')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "${_pkgname}" build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
