# Maintainer: Valeri Ochinski <v19930312@gmail.com>

pkgname=nxdumpclient
pkgver=1.0.2
pkgrel=0
pkgdesc="Client program for dumping over USB with nxdumptool"
arch=('x86_64' 'aarch64')
url="https://github.com/v1993/nxdumpclient"
license=('GPL3')
groups=()
depends=('glib2' 'gtk4' 'libadwaita' 'libgusb')
makedepends=('meson' 'vala' 'blueprint-compiler')
source=('https://github.com/v1993/nxdumpclient/archive/refs/tags/v1.0.2.tar.gz')
sha256sums=('9523360d75bdf5bc10f79eeb0740b6859970d2dea459b91b426782a2defbae2a')

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
