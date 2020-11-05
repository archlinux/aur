# Maintainer: Peter K. Moss <peter@moss.dk>
pkgname=qmarkdown-git
pkgver=r90.58bb1a4
pkgrel=1
pkgdesc="qMarkdown - minimal markdown viewer"
arch=("x86_64")
url="https://github.com/Peterkmoss/qmarkdown"
license=('GPL')
depends=('qt5-base' 'qt5-webengine' 'qt5-webchannel')
optdepends=('ttf-roboto')
makedepends=('gcc>=9' 'git' 'cmake>=3.1.0')
provides=('qmarkdown')
conflicts=('qmarkdown')
source=('git+https://github.com/Peterkmoss/qmarkdown')
md5sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${pkgname%-git}"
    cmake .
	make
}

package() {
	cd "${pkgname%-git}"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
