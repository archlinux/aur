# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=earlyoom
pkgver=0.9
pkgrel=1
pkgdesc="Early OOM Daemon for Linux"
arch=('any')
url="https://github.com/rfjakob/earlyoom"
license=('MIT')
source=(
	"https://github.com/rfjakob/$pkgname/archive/v$pkgver.tar.gz"
)
md5sums=('59fe2bff6677686a76e6aaec5b4b2be8')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"

	# earlyoom's make install script can't be parameterized for a location, therefore do it by hand.
	install -d "${pkgdir}/usr/bin/"
	install -d "${pkgdir}/usr/lib/systemd/system/"
	install -m 644 ./earlyoom.service "${pkgdir}/usr/lib/systemd/system/earlyoom.service"
	install -m 755 ./earlyoom "${pkgdir}/usr/bin/earlyoom"
}
