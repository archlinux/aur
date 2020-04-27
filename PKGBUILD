# Maintainer: Frederik “Freso” S. Olesen <archlinux@freso.dk>
_pkgname=low-memory-monitor
pkgname=${_pkgname}-git
pkgver=2.0.r16.g5e06b3b
pkgrel=1
pkgdesc='Early boot daemon monitoring memory pressure information and invokes OOM if needed'
arch=('x86_64')
url="https://gitlab.freedesktop.org/hadess/${_pkgname}"
license=('GPL3')
depends=('systemd')
makedepends=('meson' 'git' 'gtk-doc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
