# Maintainer: musiclover <musiclover382@protonmail.com>

pkgname=kooha-git
pkgver=2.2.2.r13.g705e8dc
pkgrel=1
pkgdesc="Elegantly record your screen"
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
arch=('x86_64')
url="https://github.com/SeaDve/kooha"
license=('GPL3')
depends=('gst-plugin-pipewire' 'gstreamer-vaapi' 'gst-plugins-ugly' 'gtk4' 'libadwaita'
         'x264' 'xdg-desktop-portal' 'libpulse')
makedepends=('cargo' 'meson')
b2sums=('SKIP')
source=(git+$url)

pkgver() {
	cd ${pkgname%-git}
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson ${pkgname%-git} build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}

