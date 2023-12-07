# Maintainer: SteamedFish <steamedfish@hotmail.com>
# Contributor: Joshua Rubin <me at jawa dot dev>
pkgname=soapysdrplay3-luarvique-git
pkgver=r139.fcac835
pkgrel=1
pkgdesc="Soapy SDR module for SDRPlay APIv3"
arch=('i686' 'x86_64')
url="http://www.sdrplay.com"
license=('MIT')
depends=('soapysdr' 'libsdrplay' 'gcc-libs')
provides=('soapysdrplay3' 'soapysdrplay')
conflicts=('soapysdrplay3' 'soapysdrplay3-git')
makedepends=('cmake' 'git')
install=${pkgname}.install
source=("$pkgname::git+https://github.com/luarvique/SoapySDRPlay3.git")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cmake -B build -S "$srcdir/$pkgname" -DCMAKE_INSTALL_PREFIX=/usr
	make -C build
}

package() {
	make -C build DESTDIR="$pkgdir/" install
	install -D -m644 $srcdir/$pkgname/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
