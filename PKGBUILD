# Maintainer: ahub <ahub@riseup.net>
pkgname=wf-recorder-git
_pkgname=wf-recorder
pkgver=r139.2bb52d8
pkgrel=1
license=("MIT")
pkgdesc="A video recorder for wlroots-based compositors like sway or wayfire"
makedepends=("scdoc" "meson" "git" "wayland-protocols" "ninja")
depends=(
	"wayland" "ffmpeg" "x264" "opencl-headers" "ocl-icd"
)
optdepends=(
    "slurp: limit recording to a part of the screen"
)
arch=("i686" "x86_64" "aarch64")
url="https://github.com/ammen99/wf-recorder"
source=("${pkgname%-*}::git+https://github.com/ammen99/wf-recorder")
sha1sums=("SKIP")
provides=("wf-recorder")
conflicts=("wf-recorder")

pkgver() {
	cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_pkgname}"
	meson --prefix=/usr build
	cd build
	ninja
}

package() {
	cd "${srcdir}/${_pkgname}/build"
	DESTDIR="$pkgdir" ninja install
}
