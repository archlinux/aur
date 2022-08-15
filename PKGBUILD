pkgname=wf-info-git
_pkgname=wf-info
pkgver=r1.e49623e
pkgrel=1
pkgdesc="A simple wayfire plugin and program to get information from wayfire"
arch=(x86_64)
url=https://github.com/soreau/wf-info
license=(unknow)
depends=(wayfire)
makedepends=(meson ninja pkg-config git cmake  wayland-protocols glm)
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("git+https://github.com/soreau/wf-info.git")
sha256sums=('SKIP')
pkgver() {
    cd $_pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	rm -rf build
	arch-meson "${_pkgname}" build
	ninja -C build
}

check () {
	meson test -C build
}

package() {
	DESTDIR="${pkgdir}" ninja -C build install
}

