# Maintainer: solaraquarion <shlomochoina@gmail.com>
pkgname=qdocumentview-git
pkgver=r7.d58dd20
pkgrel=1
pkgdesc="QDocumentView is a widget to render multi-page documents"
arch=('x86_64')
url="https://gitlab.com/marcusbritanicus/qdocumentview"
license=('GPL')
depends=('qt5-base' 'djvulibre' 'poppler-qt5')
makedepends=('meson' 'git' 'poppler-qt5')
provides=()
conflicts=()
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/qdocumentview"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	arch-meson qdocumentview build
	ninja -C build
}

package() {
	DESTDIR="$pkgdir/" ninja -C build install
}

