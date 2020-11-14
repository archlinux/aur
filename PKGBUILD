# Maintainer: Dan Nixon <dan@dan-nixon.com>
pkgname=dapnetgateway-git
pkgver=r133.8893f25
pkgrel=1
pkgdesc="Gateway linking the MMDVM to the DAPNET."
arch=('x86_64' 'i686')
url="https://github.com/g4klx/DAPNETGateway"
license=('GPL2')
depends=()
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('dapnetgateway::git+https://github.com/g4klx/DAPNETGateway.git')
md5sums=('SKIP')
backup=('etc/DAPNETGateway.ini')

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
	install -Dm 755 DAPNETGateway "${pkgdir}/usr/bin/DAPNETGateway"
	install -Dm 600 DAPNETGateway.ini "${pkgdir}/etc/DAPNETGateway.ini"
}
