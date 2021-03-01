# Maintainer: Chris Brendel <cdbrendel@gmail.com>
pkgname=mini_sendmail
pkgver=1.3.9
pkgrel=1
pkgdesc="Accept email on behalf of real sendmail"
arch=('any')
url="https://acme.com/software/mini_sendmail/"
license=('custom')
makedepends=('make' 'gcc')
source=("https://acme.com/software/mini_sendmail/mini_sendmail-${pkgver}.tar.gz")
md5sums=('0769b6d3ba64fa77a52a90c8866fc4ed')

prepare() {
	cd "$pkgname-$pkgver"
	sed -n '/Copyright /,//p' mini_sendmail.8 | sed -e 's/.\\" //' > LICENSE
}

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "mini_sendmail" "$pkgdir/usr/bin/mini_sendmail"
    install -Dm644 "mini_sendmail.8" "$pkgdir/usr/share/man/man8/mini_sendmail.8"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
