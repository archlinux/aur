# Maintainer: Dan Nixon <dan@dan-nixon.com>
pkgname=aprsgateway-git
pkgver=r37.6bee1c1
pkgrel=1
pkgdesc="A single point of access to the APRS network for other radio network gateway programs."
arch=('x86_64' 'i686')
url="https://github.com/g4klx/APRSGateway"
license=('GPL2')
depends=()
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('aprsgateway::git+https://github.com/g4klx/APRSGateway.git')
md5sums=('SKIP')
backup=('etc/APRSGateway.ini')

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
	install -Dm 755 APRSGateway "${pkgdir}/usr/bin/APRSGateway"
	install -Dm 600 APRSGateway.ini "${pkgdir}/etc/APRSGateway.ini"
}
