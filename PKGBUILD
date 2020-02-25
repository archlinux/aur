#Maintainer: Plague-doctor <plague at privacyrequired dot com >

pkgver=2.1.0
pkgrel=1
PN="pcloudcc"
pkgname=$PN
pkgdesc="A simple linux console client for pCloud cloud storage."
arch=('x86_64')
url="https://github.com/pcloudcom/console-client"
license=('GPL')
depends=('zlib' 'fuse')
makedepends=('cmake' 'boost')
source=("$pkgname-$pkgver-$pkgrel-src.zip"::"https://github.com/plague-doctor/console-client/archive/master.zip")

sha256sums=('8bb6895a1eddb06e3e22342b684d6231c34dd51078a66db3b4c953d1ff217c76')

validpgpkeys=('A8F7858263C1E39480B731DCEAD4F103068DF8E5')

build() {
  cd "$srcdir/console-client-master/pCloudCC/lib/pclsync"
  make clean
  make fs
  cd "$srcdir/console-client-master/pCloudCC/lib/mbedtls"
  cmake .
  make clean
  make
  cd "$srcdir/console-client-master/pCloudCC"
  cmake .
  make
}

package() {
  install -d "$pkgdir/usr/"{bin,lib}
  install -Dm775 "$srcdir/console-client-master/pCloudCC/pcloudcc" "$pkgdir/usr/bin/pcloudcc"
  install -Dm664 "$srcdir/console-client-master/pCloudCC/libpcloudcc_lib.so" "$pkgdir/usr/lib/libpcloudcc_lib.so"
}
