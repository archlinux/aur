#Maintainer: Plague-doctor <plague at privacyrequired dot com >

pkgver=2.0.1
PN="pcloudcc"
pkgname=$PN
pkgrel=3
pkgdesc="A simple linux console client for pCloud cloud storage."
arch=('x86_64')
url="https://github.com/plague-doctor/console-client"
license=('GPL')
depends=('cmake' 'zlib' 'boost' 'fuse')
source=("$pkgname-$pkgver-$pkgrel-src.zip"::"https://github.com/plague-doctor/console-client/archive/master.zip")

sha256sums=('1bfe24fccbe798cce95710cd94b5cc6c6202d015e21062df277735144a52e61c')

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
