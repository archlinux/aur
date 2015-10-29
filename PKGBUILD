# Contributor: Andrea Zucchelli <zukka77@gmail.com>

pkgname=xca
pkgver=1.3.2
pkgrel=2
pkgdesc="graphical user interface to OpenSSL, RSA/DSA public keys, certificates, signing requests and revokation lists"
arch=('i686' 'x86_64')
url="http://www.hohnstaedt.de/xca.html"
license=('BSD')
depends=('qt5-base' 'libltdl' 'shared-mime-info' 'qt5-tools')
makedepends=('linuxdoc-tools')
source=("http://downloads.sourceforge.net/sourceforge/xca/$pkgname-$pkgver.tar.gz")
md5sums=('f9528164f46a78c7a2373778bc019c48')

build ()
{
cd $srcdir/$pkgname-$pkgver
CFLAGS=-fPIC ./configure --prefix=/usr --sysconfdir=/etc
sed -i  -r 's/(^LDFLAGS.*$)/LDFLAGS='"'"'-lstdc++'"'"'/' Local.mak
}

package(){
cd "$srcdir/$pkgname-$pkgver"
make install destdir=$pkgdir || return 1
install -D -m644 COPYRIGHT $pkgdir/usr/share/licenses/$pkgname/COPYRIGHT
}

install=xca.install
