# Maintainer: éclairevoyant

_pkgname=aviator
pkgname="$_pkgname-git"
pkgver=r125.157d4a5
pkgrel=1
pkgdesc="Easy-to-use GUI for encoding with SVT-AV1/libopus"
arch=(any)
url="https://github.com/gianni-rosato/$_pkgname"
license=(GPL3)
depends=(ffmpeg gtk4 libadwaita python-ffmpeg-progress-yield python-gobject svt-av1)
makedepends=(git meson python-setuptools)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git"
        0001-create-runtime-dir-if-needed.patch)
b2sums=('SKIP'
        'caf80c1a2ac45d94c976b652c8aa405bb22bd85af917349469a1d48154515bbbeadf48ebbc953c619f0f90887f9d0680011d31afb0ee7e50d41541e20a129879')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd $_pkgname
	patch -Np1 -i ../0001-create-runtime-dir-if-needed.patch
}

build() {
	arch-meson $_pkgname build
	meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
}
