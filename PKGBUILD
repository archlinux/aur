# Maintainer: Joshua Rubin <me at jawa dot dev>
pkgname=soapysdrplay3-git
pkgver=r63.f0a8439
pkgrel=1
pkgdesc="Soapy SDR module for SDRPlay"
arch=('i686' 'x86_64')
url="http://www.sdrplay.com"
license=('MIT')
depends=('soapysdr' 'libsdrplay')
provides=('soapysdrplay')
conflicts=('soapysdrplay-git')
makedepends=('cmake')
install=${pkgname}.install
source=("$pkgname::git+https://github.com/pothosware/SoapySDRPlay3.git")
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
