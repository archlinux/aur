# Maintainer: Kristóf Jakab <jaksi@jaksi.io>
pkgname=zorp
pkgver=6.0.7
pkgrel=1
pkgdesc='A new generation proxy firewall suite'
arch=('x86_64')
url='https://github.com/balabit/zorp'
license=('GPL2')
makedepends=('gperf')
depends=('libzorpll' 'python2')
source=(
	'https://github.com/balabit/zorp/archive/v6.0.7.tar.gz'
	'0001-Consider-only-python2-and-python2.7.patch'
)
md5sums=(
	'0f1a27596935244efc6d43cd1285fb8c'
	'f9b828ed00f5c2e8e71ae9f965736e2b'
)

build() {
	cd "$srcdir/zorp-6.0.7"
	patch -p1 < '../../0001-Consider-only-python2-and-python2.7.patch'
	./autogen.sh
	./configure --prefix=/usr --sysconfdir=/etc
	make
}

package() {
	cd "$srcdir/zorp-6.0.7"
	make DESTDIR="$pkgdir/" install
	rm -r "$pkgdir/usr/var/"
}
