pkgname=wf-kill-git
_pkgname=wf-kill
pkgver=r6.c667279
pkgrel=1
pkgdesc="A way to close a wayfire view by clicking on it. Returns the client PID"
arch=(x86_64)
url=https://github.com/soreau/wf-kill
license=(unknow)
depends=(wayfire)
makedepends=(meson ninja pkg-config git cmake wayland-protocols glm)
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("git+https://github.com/soreau/wf-kill.git")
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


