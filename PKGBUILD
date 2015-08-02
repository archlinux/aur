# $Id$
# Maintainer: Itay Grudev <itay@grudev.com>

pkgname=imperial
pkgver=1.1
pkgrel=0
pkgdesc='Plays the Imperial March using the beep utility'
arch=('any')
url='https://github.com/itay-grudev/imperial'
license=('mit')
depends=('beep')
source=("$pkgname-$pkgver.tar.gz::https://github.com/itay-grudev/imperial/archive/$pkgver.tar.gz"
	"https://raw.githubusercontent.com/itay-grudev/imperial/arch/imperial.service")
md5sums=('a96a83feaa767b2784e5c2f4cfdafc8e'
         'bcfe5ab48b096ad8fdbac87990ba02d8')

build() {
	cd "$srcdir/imperial-$pkgver"
	gzip -9 -f imperial.1
}

package() {
	cd "$srcdir/imperial-$pkgver"
	
	install -Dm 775 imperial "$pkgdir/usr/bin/imperial"
	install -Dm 644 "${srcdir}/imperial.service" "${pkgdir}/usr/lib/systemd/system/imperial.service"
	install -Dm 644 imperial.1.gz "$pkgdir/usr/share/man/man1/imperial.1.gz"
	install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
