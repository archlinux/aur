# Maintainer: Peter K. Moss <peter@moss.dk>
pkgname=qmarkdown-git
pkgver=r164.9a6e5fd
pkgrel=1
pkgdesc="qMarkdown - minimal markdown viewer"
arch=("x86_64")
url="https://github.com/Peterkmoss/qmarkdown"
license=('GPL')
depends=('qt6-base>=6.3.0' 'qt6-webengine>=6.3.0' 'qt6-webchannel>=6.3.0')
optdepends=('ttf-roboto')
makedepends=('git' 'cmake>=3.1.0')
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
