# Maintainer: Dan Nixon <dan@dan-nixon.com>
pkgname=dmrgateway-git
pkgver=r322.5ca0d6e
pkgrel=2
pkgdesc="A multi-network DMR gateway for the MMDVM."
arch=('x86_64' 'i686')
url="https://github.com/g4klx/DMRGateway"
license=('GPL2')
depends=()
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('dmrgateway::git+https://github.com/g4klx/DMRGateway.git')
md5sums=('SKIP')
backup=('etc/DMRGateway.ini')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make all
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm 755 DMRGateway "${pkgdir}/usr/bin/DMRGateway"
	install -Dm 600 DMRGateway.ini "${pkgdir}/etc/DMRGateway.ini"
}
