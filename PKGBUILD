# Contributor: Michael Krauss <hippodriver@gmx.net>
# $Id: PKGBUILD,v 1.2 2010/12/25 18:46:11 andres Exp $

pkgname="dma"
pkgver=0.13
pkgrel=1
pkgdesc="DragonFly BSD mail transport agent"
url="https://github.com/corecode/dma"
license=('BSD')
makedepends=('ed')
depends=('openssl')
provides=('smtp-forwarder')
conflicts=('smtp-forwarder')
backup=('etc/dma/auth.conf' 'etc/dma/dma.conf')
arch=('i686' 'x86_64')
source=("https://github.com/corecode/dma/archive/v$pkgver.tar.gz")
sha256sums=('9d4b903f2b750d888f51d668d08d2ea18404dedb0a52cffeb3c81376023c1946')

buildargs="PREFIX=/usr LIBEXEC=/usr/lib/dma SBIN=/usr/bin"

build() {
	cd dma-$pkgver
	make $buildargs
}

package() {
	cd dma-$pkgver
	make install sendmail-link mailq-link install-etc DESTDIR=$pkgdir $buildargs

	install -d -o root -g mail -m 2775 $pkgdir/var/spool/dma

        install -d -m 755 $pkgdir/usr/share/licenses/$pkgname
	install LICENSE $pkgdir/usr/share/licenses/$pkgname
}
