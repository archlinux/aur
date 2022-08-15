pkgname=wf-ctrl-git
_pkgname=wf-ctrl
pkgver=r10.d63ab76
pkgrel=1
pkgdesc="A wayfire plugin and program to control wayfire surfaces and desktop"
arch=(x86_64)
url=https://github.com/soreau/wf-ctrl
license=(unknow)
depends=(wayfire-git)
makedepends=(meson ninja pkg-config git cmake wayland-protocols glm)
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("git+https://github.com/soreau/wf-ctrl.git")
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


