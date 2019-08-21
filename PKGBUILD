# Maintainer: Frederik “Freso” S. Olesen <archlinux@freso.dk>
_pkgname=low-memory-monitor
pkgname=${_pkgname}-git
pkgver=r20.bd5d587
pkgrel=1
pkgdesc='Early boot daemon monitoring memory pressure information and invokes OOM if needed'
arch=('x86_64')
url="https://gitlab.freedesktop.org/hadess/${_pkgname}"
license=('GPL3')
depends=('systemd')
makedepends=('meson' 'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${_pkgname}"
	meson --prefix /usr --buildtype=plain ./ build
	ninja -C build
}

check() {
	cd "$srcdir/${_pkgname}"
	ninja -C build test
}

package() {
	cd "$srcdir/${_pkgname}"
	DESTDIR="$pkgdir" ninja -C build install
}
