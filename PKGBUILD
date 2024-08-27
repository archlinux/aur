# Maintainer: Valeri Ochinski <v19930312@gmail.com>

pkgname=nxdumpclient-git
pkgver=1.1.2.r7.gd3b24f7
pkgrel=1
pkgdesc="Client program for dumping over USB with nxdumptool"
arch=('x86_64' 'aarch64')
url="https://github.com/v1993/nxdumpclient"
license=('GPL3')
groups=()
depends=('glib2' 'gtk4' 'libadwaita' 'libgusb')
makedepends=('git' 'meson' 'vala' 'blueprint-compiler')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('nxdumpclient::git+https://github.com/v1993/nxdumpclient.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	arch-meson -Dlibportal=disabled "$srcdir/${pkgname%-git}" build
	meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
}
