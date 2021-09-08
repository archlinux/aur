# Maintainer: Peter K. Moss <peter@moss.dk>
pkgname=qmarkdown-git
pkgver=r162.ce08edc
pkgrel=1
pkgdesc="qMarkdown - minimal markdown viewer"
arch=("x86_64")
url="https://github.com/Peterkmoss/qmarkdown"
license=('GPL')
depends=('qt5-base>=5.9.0' 'qt5-webengine>=5.9.0' 'qt5-webchannel>=5.9.0')
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
