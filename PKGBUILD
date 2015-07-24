# Maintainer: M0Rf30

pkgname=i2pd
pkgver=0.10.0
pkgrel=1
pkgdesc="Simplified C++ implementation of I2P client"
arch=('i686' 'x86_64')
url="https://github.com/PurpleI2P/i2pd"
license=('GPL2')
depends=(crypto++ boost-libs)
makedepends=(boost)
conflicts=(i2pd-git)
install=i2pd.install
source=(https://github.com/PurpleI2P/${pkgname}/archive/${pkgver}.tar.gz
        i2pd.service
	i2p.conf
	i2pd.tmpfiles.conf)

build() {
    cd $srcdir/$pkgname-$pkgver
    make CXXFLAGS="$CXXFLAGS"
}

package() {
    cd $srcdir/$pkgname-$pkgver
    install -Dm755 i2p $pkgdir/usr/bin/i2p
    install -Dm0644 $srcdir/i2pd.service $pkgdir/usr/lib/systemd/system/i2pd.service
    install -Dm0644 ../i2p.conf $pkgdir/var/lib/i2pd/i2p.conf
    install -Dm0644 $srcdir/i2pd.tmpfiles.conf $pkgdir/usr/lib/tmpfiles.d/i2pd.conf
}

md5sums=('4889026c2d051bacb24b67925f8ceada'
         'c37b5470c959e826be8eb40c8f1ece93'
         'b145e41e22806bd4ca4f4064ec4721a2'
         '862be388708f2b1bd5f727715ec7508d')
