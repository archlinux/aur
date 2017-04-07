#Maintainer: Plague-doctor <plague at privacyrequired dot com >

commit="b1cc3878daaf7742dd2b5635614f389f8305d5e4"
pkgver=2.0.1
PN="pcloudcc"
pkgname=$PN
pkgrel=2
pkgdesc="A simple linux console client for pCloud cloud storage."
arch=('x86_64')
url="https://github.com/pcloudcom/console-client"
license=('GPL')
depends=('cmake' 'zlib' 'boost' 'fuse')
source=("https://github.com/pcloudcom/console-client/archive/$commit.zip")

md5sums=('99a9b9e70eeb3baa0ad759fadaae3053')

validpgpkeys=('A8F7858263C1E39480B731DCEAD4F103068DF8E5')

build() {
  cd "$srcdir/console-client-$commit/pCloudCC/lib/pclsync"
  make clean
  make fs
  cd "$srcdir/console-client-$commit/pCloudCC/lib/mbedtls"
  cmake .
  make clean
  make
  cd "$srcdir/console-client-$commit/pCloudCC"
  cmake .
  make
}

package() {
  install -d "$pkgdir/usr/"{bin,lib}
  install -Dm775 "$srcdir/console-client-$commit/pCloudCC/pcloudcc" "$pkgdir/usr/bin/pcloudcc"
  install -Dm664 "$srcdir/console-client-$commit/pCloudCC/libpcloudcc_lib.so" "$pkgdir/usr/lib/libpcloudcc_lib.so"
}
