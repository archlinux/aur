# Maintainer: coxackie
# Contributor: plague-doctor

pkgver=2.0.1
pkgrel=2
pkgname="pcloudcc"
pkgdesc="A simple linux console client for pCloud cloud storage."
provides=("pcloudcc")
conflicts=("pcloudcc-git")
arch=('x86_64')
url="https://github.com/pcloudcom/console-client"
license=('GPL')
depends=('zlib' 'fuse')
makedepends=('cmake' 'boost')
source=("$pkgname"::"git+https://github.com/pcloudcom/console-client.git")

sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname/pCloudCC/lib/pclsync"
  make clean
  make fs
  cd "$srcdir/$pkgname/pCloudCC/lib/mbedtls"
  cmake .
  make clean
  make
  cd "$srcdir/$pkgname/pCloudCC"
  cmake .
  make
}

package() {
  install -d "$pkgdir/usr/"{bin,lib}
  install -Dm775 "$srcdir/pcloudcc/pCloudCC/pcloudcc" "$pkgdir/usr/bin/pcloudcc"
  install -Dm664 "$srcdir/pcloudcc/pCloudCC/libpcloudcc_lib.so" "$pkgdir/usr/lib/libpcloudcc_lib.so"
}
