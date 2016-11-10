# Maintainer: skogler

pkgname=barnyard2
pkgver=1.13
pkgrel=1
pkgdesc="A dedicated spooler for Snort's unified2 binary output format."
arch=('i686' 'x86_64')
url="http://www.github.com/firnsy/barnyard2"
license=('GPL')
depends=('libpcap' 'libmariadbclient')
options=()
source=("https://github.com/firnsy/$pkgname/archive/v2-$pkgver.tar.gz")
md5sums=('212066058364f18a4806720b271ffd87')

prepare() {
    cd "$pkgname-2-$pkgver"
}

build() {
    cd "$pkgname-2-$pkgver"
    ./autogen.sh
    ./configure --prefix=/usr --sysconfdir=/etc/ --with-mysql --with-mysql-          libraries=/usr/lib/
    make
}

check() {
    cd "$pkgname-2-$pkgver"
    make -k check
}

package() {
    cd "$pkgname-2-$pkgver"
    make DESTDIR="$pkgdir/" install
    chmod 644 "$pkgdir/etc/barnyard2.conf"
}
