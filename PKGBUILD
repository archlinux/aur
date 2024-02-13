# Maintainer: MGislv <mgislv at ceppo dot xyz>
# Contributor: Adrian Kocis <adrian dot kocis at gmail>
# Contributor: Swift Geek

pkgname=pamix-git
pkgver=1.6.r10.gea4ab3b.31.g1609e38
pkgrel=1
pkgdesc="ncurses/curses PulseAudio mixer"
arch=('x86_64_v3' 'x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url="https://github.com/patroclos/PAmix"
license=('MIT')
depends=('ncurses' 'libpulse')
makedepends=('git' 'cmake')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("${pkgname%-git}::git+$url.git")
md5sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cmake -S "${pkgname%-git}" -B build \
	      -DWITH_UNICODE=YES \
	      -DNCURSESW_H_INCLUDE='ncurses.h' \
	      -DCMAKE_INSTALL_PREFIX='/usr' \
	      -DCMAKE_SKIP_RPATH=YES \
	      -DCMAKE_SKIP_INSTALL_RPATH=YES
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 "${pkgname%-git}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
