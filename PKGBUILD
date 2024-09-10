# Maintainer: silverhikari
pkgname=talentedhack-git
_pkgname=TalentedHack
pkgver=v1.92.r0.1b4c2e9
pkgrel=1
pkgdesc="a lv2 conversion of autotalent, a pitch correction plugin"
arch=(x86_64)
url="https://github.com/jeremysalwen/TalentedHack"
license=('GPL-3.0-or-later')
depends=('fftw')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/jeremysalwen/TalentedHack')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname%-git}"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
    cd "$srcdir/${_pkgname%-git}"
    make
}

package() {
	cd "$srcdir/${_pkgname%-git}"
	mkdir -p "${pkgdir}/usr/lib/lv2/TalentedHack.lv2"
	install -m755 talentedhack.so "${pkgdir}/usr/lib/lv2/TalentedHack.lv2"
	install -m644 manifest.ttl talentedhack.ttl "${pkgdir}/usr/lib/lv2/TalentedHack.lv2"
}
