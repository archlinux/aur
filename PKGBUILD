# Contributor: Ahmed ES <ahmed.es.egypt@gmail.com>

pkgname='vramsteg-git'
pkgver=r6.1f3dbd6
pkgrel=1
pkgdesc="Command line utility that provides shell scripts with a full-featured progress indicator"
provides=('vramsteg')
arch=('x86_64')
url="https://github.com/mogaal/vramsteg"
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'cmake')
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
	cd "vramsteg"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cmake -S vramsteg -B build -DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 "vramsteg/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
