# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=obs-xdg-portal-git
pkgver=0.1.2
pkgrel=1
pkgdesc="OBS Studio plugin using the Desktop portal for Wayland & X11 screencasting"
arch=(x86_64)
url="https://gitlab.gnome.org/feaneron/obs-xdg-portal"
license=('GPL')
depends=('obs-studio' 'gst-plugins-base-libs')
makedepends=('meson' 'git')
source=("git+$url")
md5sums=('SKIP')

pkgver() {
	cd "obs-xdg-portal"
	git describe --tags | sed 's/-/+/g'
}

build() {
  meson --prefix /usr --buildtype=plain "obs-xdg-portal" build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
