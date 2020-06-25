# Packager: push_sla <push2001sla@gmail.com>
# Maintainer: pushsla <github.com/pushsla>

pkgname=torodofi-git
_pkgname=torodofi
pkgver=89.73e5b7d
pkgrel=2
pkgdesc="Simple ToDo task manager using pure MarkDown file to store your tasks. Active/Done, tags, deadlines support. Rofi GUI."
arch=('x86_64')
url="https://github.com/pushsla/torodofi"
license=('MIT')
groups=()
depends=('rofi>=1.5.4' 'util-linux>=2.35.1')
makedepends=('cmake>=3.10.0' 'gcc>=9.0.0' 'git>=2.25.0')
source=("git+https://github.com/pushsla/torodofi.git")
md5sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${_pkgname}"
	cmake -DCMAKE_INSTALL_PREFIX=/usr -S . -B build
	cmake --build build
}

package() {
	cd "$srcdir/torodofi"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	cd "$srcdir/torodofi/build"
	make DESTDIR="$pkgdir/" install
}
