# Maintainer: Mario Moura <mario.henrique@protonmail.com>
pkgname=packit
pkgver=1.8
pkgrel=1
pkgdesc="network packet generator and capture tool"
arch=('any')
url="https://github.com/resurrecting-open-source-projects/packit"
license=('GPL2')
depends=('libnet>=1.1.2' 'libpcap>=0.8')
makedepends=('git')
changelog=Changelog
source=("git+$url")
md5sums=('SKIP')

build() {
	cd "$pkgname"
	./autogen.sh
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname"
	make check
}

package() {
	cd "$pkgname"
	mkdir -p $pkgdir/usr/local/sbin
	/usr/bin/install  src/packit  $pkgdir/usr/local/sbin
	mkdir -p $pkgdir/usr/local/man/man8
	/usr/bin/install -m 644 man/packit.8 $pkgdir/usr/local/man/man8
}
