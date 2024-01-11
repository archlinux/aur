# Contributor: Chris Brannon <cmbrannon79@gmail.com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=nmh
pkgver=1.8
pkgrel=2
pkgdesc='Powerful electronic mail handling system, based on a set of command-line utilities.'
arch=('i686' 'x86_64')
license=(BSD)
url='http://www.nongnu.org/nmh/'
depends=('db' 'openssl' 'libsasl')
conflicts=("${pkgname%-*}")
backup=(etc/nmh/MailAliases
        etc/nmh/components
        etc/nmh/digestcomps
        etc/nmh/distcomps
        etc/nmh/forwcomps
        etc/nmh/mhl.body
        etc/nmh/mhl.digest
        etc/nmh/mhl.format
        etc/nmh/mhl.forward
        etc/nmh/mhl.headers
        etc/nmh/mhl.reply
        etc/nmh/mhn.defaults
        etc/nmh/mts.conf
        etc/nmh/rcvdistcomps
        etc/nmh/rcvdistcomps.outbox
        etc/nmh/replcomps
        etc/nmh/replgroupcomps
        etc/nmh/scan.MMDDYY
        etc/nmh/scan.YYYYMMDD
        etc/nmh/scan.default
        etc/nmh/scan.mailx
        etc/nmh/scan.nomime
        etc/nmh/scan.size
        etc/nmh/scan.time
        etc/nmh/scan.timely
        etc/nmh/scan.unseen)
source=("http://download.savannah.nongnu.org/releases/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('a9bb7636cd8a75c522a48f5d942314fb')
sha1sums=('48a8f390a4c44e4df1859caf71677a6504492703')
sha256sums=('366ce0ce3f9447302f5567009269c8bb3882d808f33eefac85ba367e875c8615')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr         \
	            --sysconfdir=/etc     \
	            --libdir=/usr/lib     \
	            --libexecdir=/usr/lib \
	            --with-cyrus-sasl     \
	            --with-tls
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	install -D -m644 COPYRIGHT $pkgdir/usr/share/licenses/$pkgname/COPYRIGHT
}
