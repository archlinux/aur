# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=docker-lvm-plugin-git
pkgver=1.0.r14.d45273f
pkgrel=1
pkgdesc='Docker volume driver for LVM volumes'
arch=('x86_64')
url='https://github.com/containers/docker-lvm-plugin'
license=('GPL3')
makedepends=('go' 'go-md2man')
provides=('docker-lvm-plugin')
conflicts=('docker-lvm-plugin')
source=('git+https://github.com/containers/docker-lvm-plugin')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/docker-lvm-plugin"
	printf "%s" "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/^v//')"
}

build() {
	cd docker-lvm-plugin
	export GO111MODULE=on
	make
}

package() {
	cd docker-lvm-plugin
	make DESTDIR="$pkgdir/" install
}
