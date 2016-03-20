# Maintainer: Dan McCurry <dan.mccurry at linux dot com>
pkgname=soapysdrplay-git
pkgver=r66.3890517
pkgrel=1
pkgdesc="Soapy SDR module for SDRPlay"
arch=('i686' 'x86_64')
url="http://www.sdrplay.com"
license=('MIT')
depends=('soapysdr-git' 'libsdrplay')
makedepends=('cmake')
install=${pkgname}.install
source=("$pkgname::git://github.com/pothosware/SoapySDRPlay.git")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
        cd "$pkgname"
	mkdir build
}

build() {
	cd "$pkgname/build"
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

package() {
	cd "$pkgname/build"
	make DESTDIR="$pkgdir/" install
	install -D -m644 $srcdir/$pkgname/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
