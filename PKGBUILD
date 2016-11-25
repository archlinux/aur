# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=freebsd-man-pages
pkgver=11.0
pkgrel=1
pkgdesc="The FreeBSD manual pages."
arch=('i686' 'x86_64')
url="https://www.freebsd.org/cgi/man.cgi"
license=('BSD')
provides=('$pkgname' 'freebsd-manpages')
conflicts=('$pkgname' 'freebsd-manpages')
source_i686=("ftp://ftp.freebsd.org/pub/FreeBSD/releases/i386/i386/$pkgver-RELEASE/base.txz")
source_x86_64=("ftp://ftp.freebsd.org/pub/FreeBSD/releases/amd64/amd64/$pkgver-RELEASE/base.txz")
md5sums_i686=('8ebbe0bd10a269434fb1e42693578306')
md5sums_x86_64=('7522dbd3c3b9ca440eda732469304c0a')

prepare() {
    cd ./usr/share/man
    msg2 'Renaming man pages for consistency with linux man pages.'	
	find . -iname "*.gz" -exec rename .gz freebsd.gz '{}' \;
}

package() {
    cd ./usr/share/man
	install -d $pkgdir/usr/share/man
	cp -a ./man{1..9} $pkgdir/usr/share/man/
}
