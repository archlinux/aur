# Contributor: Andrea Zucchelli <zukka77@gmail.com>

pkgname=xca
pkgver=1.4.0
pkgrel=1
pkgdesc="graphical user interface to OpenSSL, RSA/DSA public keys, certificates, signing requests and revokation lists"
arch=('i686' 'x86_64')
url="http://www.hohnstaedt.de/xca.html"
license=('BSD')
depends=('qt5-base' 'libltdl' 'shared-mime-info' 'qt5-tools')
#makedepends=('linuxdoc-tools')
source=("http://downloads.sourceforge.net/sourceforge/xca/$pkgname-$pkgver.tar.gz")
md5sums=('bf5737800bbfe65a527410a93d4a3fca')

build ()
{
cd $srcdir/$pkgname-$pkgver
PKG_CONFIG_PATH=/usr/lib/openssl-1.0/pkgconfig \
OpenSSL_CFLAGS='-I/usr/include/openssl-1.0' OpenSSL_LIBS='-L/usr/lib/openssl-1.0 -lcrypto' \
./configure --prefix=/usr --sysconfdir=/etc --with-openssl
sed -i  -r 's/(^LDFLAGS.*$)/LDFLAGS='"'"'-lstdc++'"'"'/' Local.mak
}

package(){
cd "$srcdir/$pkgname-$pkgver"
make install destdir=$pkgdir || return 1
install -D -m644 COPYRIGHT $pkgdir/usr/share/licenses/$pkgname/COPYRIGHT
}

install=xca.install
