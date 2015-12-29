# Maintainer: M0Rf30

pkgname=i2pd
pkgver=2.2.0
pkgrel=2
pkgdesc="Simplified C++ implementation of I2P client"
arch=('i686' 'x86_64')
url="https://github.com/PurpleI2P/i2pd"
license=('GPL2')
depends=('boost-libs' 'miniupnpc' 'openssl' 'zlib')
makedepends=(boost cmake)
conflicts=(i2pd-git)
install=i2pd.install
source=(https://github.com/PurpleI2P/${pkgname}/archive/${pkgver}.tar.gz
        i2pd.service
	i2p.conf
	i2pd.tmpfiles.conf)

build() {
    cd $srcdir/$pkgname-$pkgver
    cd build
    mkdir tmp
    cd tmp
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DWITH_BINARY=ON -DWITH_LIBRARY=ON -DWITH_UPNP=ON ..
    make
}

package() {
    cd $srcdir/$pkgname-$pkgver
    cd build/tmp
    make DESTDIR=$pkgdir install  


    install -Dm0644 $srcdir/i2pd.service $pkgdir/usr/lib/systemd/system/i2pd.service
    install -Dm0644 $srcdir/i2p.conf $pkgdir/var/lib/i2pd/i2p.conf
    install -Dm0644 $srcdir/i2pd.tmpfiles.conf $pkgdir/usr/lib/tmpfiles.d/i2pd.conf
}

md5sums=('62aa474f0039ab1791c3b0958ba87adc'
         '7125bfdcbb5050c5fbf7531861dc82fa'
         'b145e41e22806bd4ca4f4064ec4721a2'
         '862be388708f2b1bd5f727715ec7508d')
