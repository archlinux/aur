# Maintainer: atemmel <temmeladam@gmail.com>
pkgname=spider
pkgrel=1
pkgver=r228.1f95a80
pkgdesc="Fast and simple terminal file manager"
arch=('x86_64' 'aarch64' 'i686')
url="https://github.com/atemmel/${pkgname}"
license=('MIT')
depends=(
	'ncurses'
)
makedepends=(
    'git' 
    'zig'
)
source=("git+${url}")
sha256sums=('SKIP')

pkgver(){
	cd "${srcdir}/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${pkgname}"
	zig build -Doptimize=ReleaseFast
}

package() {
	cd "${srcdir}/${pkgname}"
	install -D -m755 zig-out/bin/$pkgname "${pkgdir}/usr/bin/${pkgname}"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
