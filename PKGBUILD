# Maintainer: Christian Mauderer <oss@c-mauderer.de>
pkgname=sii-slp-cups-git
pkgver=r10.8d75c25
pkgrel=2
pkgdesc="Linux cups drivers for Smart Label Printers slp100 slp200 slp240 slp440 slp450 slp620 slp650"
arch=('i686' 'x86_64')
url="https://github.com/paulfurley/smart-label-printer-slp-linux-driver"
license=('GPL')
depends=('cups' 'libcups' 'libjpeg' 'zlib')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/paulfurley/smart-label-printer-slp-linux-driver.git?signed")
# You can fetch that key with
#    gpg --keyserver pool.sks-keyservers.net --recv-key A999B7498D1A8DC473E53C92309F635DAD1B5517
validpgpkeys=("A999B7498D1A8DC473E53C92309F635DAD1B5517")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}/src"
	make build
}

package() {
	cd "$srcdir/${pkgname%-git}/src"
	make DESTDIR="$pkgdir/" install
}
