#Maintainer: M0Rf30

pkgname=i2pd-git
pkgver=1808.128a8f3
pkgrel=1
pkgdesc="Simplified C++ implementation of I2P client"
arch=('i686' 'x86_64')
url="https://github.com/PurpleI2P/i2pd"
license=('GPL2')
depends=('crypto++' 'boost-libs')
makedepends=('git' 'boost')
source=('i2pd::git+https://github.com/PurpleI2P/i2pd.git'
	i2pd.service
	i2p.conf
	i2pd.tmpfiles.conf)
install=i2pd.install
backup=var/lib/i2pd/i2p.conf

build() {
  cd i2pd
  make CXXFLAGS="$CXXFLAGS"
}

package(){
  cd i2pd
  install -Dm755 i2p $pkgdir/usr/bin/i2p
  install -Dm0644 $srcdir/i2pd.service $pkgdir/usr/lib/systemd/system/i2pd.service
  install -Dm0644 ../i2p.conf $pkgdir/var/lib/i2pd/i2p.conf
  install -Dm0644 $srcdir/i2pd.tmpfiles.conf $pkgdir/usr/lib/tmpfiles.d/i2pd.conf
}

pkgver() {
  cd i2pd
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

md5sums=('SKIP'
         'c37b5470c959e826be8eb40c8f1ece93'
         'b145e41e22806bd4ca4f4064ec4721a2'
         '862be388708f2b1bd5f727715ec7508d')
