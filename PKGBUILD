# Maintainer: Valeri Ochinski <v19930312@gmail.com>

pkgname=nxdumpclient
pkgver=1.1.0
pkgrel=0
pkgdesc="Client program for dumping over USB with nxdumptool"
arch=('x86_64' 'aarch64')
url="https://github.com/v1993/nxdumpclient"
license=('GPL3')
groups=()
depends=('glib2' 'gtk4' 'libadwaita' 'libgusb')
makedepends=('meson' 'vala' 'blueprint-compiler')
source=('https://github.com/v1993/nxdumpclient/archive/refs/tags/v1.1.0.tar.gz')
sha256sums=('06076e2ec1a0e5eeb6c2c662e4bdf3cfecd63779f12b21c3bd363ab6efba5453')

prepare() {
	meson subprojects download --sourcedir="$srcdir/${pkgname}"
}

build() {
	arch-meson -Denforce_build_order=true -Dlibportal=disabled "$srcdir/${pkgname}" build
	meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
}
