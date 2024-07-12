# Maintainer: Ondřej Hošek <ondra.hosek@gmail.com>
pkgname=tfrec-git
pkgver=r40.bf0803b
pkgrel=1
pkgdesc="RTL-SDR tool for receiving wireless sensor data"
arch=('x86_64')
url="https://github.com/baycom/tfrec"
license=('GPL-2.0-only')
depends=('rtl-sdr')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('tfrec::git+https://github.com/baycom/tfrec.git'
	'tfrec.patch')
sha256sums=('SKIP'
            '9187fe59df19e7ebb3aa19390cb456de28e8508604b87fb3b61e7a5124aea7f4')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	patch -p1 -i "$srcdir/${pkgname%-git}.patch"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm0755 tfrec "${pkgdir}/usr/bin/tfrec"
}
