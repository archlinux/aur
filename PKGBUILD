pkgname=wf-extra-protos-git
_pkgname=wf-extra-protos
pkgver=r3.8df1337
pkgrel=1
pkgdesc="Extra wayland protocol support for wayfire, featuring wf-menu"
arch=(x86_64)
url=https://github.com/soreau/wf-extra-protos
license=(MIT)
depends=(wayfire gtkmm-4.0)
makedepends=(meson ninja pkg-config git cmake wayland-protocols glm)
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("git+https://github.com/soreau/wf-extra-protos.git")
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


