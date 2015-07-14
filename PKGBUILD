# Maintainer: Mitch Bigelow <ipha00@gmail.com>

pkgname=masscan-git
pkgver=395.cec300a
pkgrel=1
pkgdesc="TCP port scanner, spews SYN packets asynchronously, scanning entire Internet in under 5 minutes"
arch=('i686' 'x86_64')
url="https://github.com/robertdavidgraham/masscan"
license=('AGPL')
depends=('libpcap')
makedepends=('git')
provides=('masscan')
conflicts=('masscan')
source=("$pkgname"::'git://github.com/robertdavidgraham/masscan.git')
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$pkgname"
	make
}

check() {
	cd "$pkgname"
	make regress	
}

package() {
	cd "$pkgname"

	# make install fails with spaces in ${pkgdir}. Install manually
	install -D -m755 bin/masscan "${pkgdir}/usr/bin/masscan"

	install -D -m664 doc/masscan.8 "${pkgdir}/usr/share/man/man8/masscan.8"
	install -D -m664 LICENSE "${pkgdir}/usr/share/licenses/masscan/LICENSE"
}
