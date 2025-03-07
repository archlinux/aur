# Maintainer: jzapiola <jzapiola@proton.me>

_pkgname=aviator
pkgname="$_pkgname-git"
pkgver=r210.d62aae3
pkgrel=1
pkgdesc="Easy-to-use GUI for encoding with SVT-AV1/libopus"
arch=(any)
url="https://github.com/gianni-rosato/$_pkgname"
license=("GPL-3.0-or-later")
depends=(ffmpeg gtk4 libadwaita python-ffmpeg-progress-yield python-gobject svt-av1)
makedepends=(git meson python-setuptools)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha512sums=('SKIP')
pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	arch-meson $_pkgname build
	meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
}
