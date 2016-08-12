# Maintainer: Anselmo L. S. Melo <anselmo.melo@intel.com>
pkgname=qm-dfu-util-git
pkgver=r373.9aa7b29
pkgrel=1
pkgdesc="UART-based dfu-util for Quark MCUs"
arch=('x86_64' 'i686')
url="https://github.com/quark-mcu/qm-dfu-util"
license=('GPL2')
depends=()
makedepends=('git')
provides=("${pkgname%-git}" 'dfu-util-qda')
conflicts=("${pkgname%-git}")
source=(${pkgname%-git}::'git+https://github.com/quark-mcu/qm-dfu-util.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
