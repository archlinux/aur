# Maintainer: Luigi311 <aur@luigi311.com>
pkgname=millipixels-git
pkgver=r0.21d8a94a1e
pkgrel=1
pkgdesc='GTK3 camera application that knows how to deal with the media request api'
arch=('x86_64' 'aarch64')
url="https://source.puri.sm/Librem5/millipixels.git"
license=('LGPL')
depends=('gtk3' 'zbar' 'feedbackd-git' 'rust' 'ffmpeg' 'libcamera' 'libbsd')
makedepends=('meson')
checkdepends=()
optdepends=()
provides=('millipixels')
conflicts=('millipixels')
replaces=('millipixels')
source=(millipixels-git::git+https://source.puri.sm/Librem5/millipixels.git)
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	arch-meson ${pkgname} build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	DESTDIR="${pkgdir}" meson install -C build
}

