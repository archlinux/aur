# Maintainer: mekambe <grubyogon10@gmail.com>



pkgname=libbde
pkgver=20240502
pkgrel=1
pkgdesc="Library and tools for accessing BitLocker Drive Encryption (BDE) encrypted volumes"
url="https://github.com/libyal/libbde"
arch=('x86_64')
license=('GPL3')
depends=('openssl' 'libcrypt.so')
makedepends=('python' 'git' 'gcc')
optdepends=('fuse: bdemount support')
provides=('libbde.so' 'pybde.so' 'python-pybde')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/libbde-alpha-$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::$url/releases/download/$pkgver/libbde-alpha-$pkgver.tar.gz.asc")
sha256sums=('2daeabcc139fc812170e7efcbd76fc194b7c8e0424ceca8cdfc91167bb77169d'
'bbe9bddbf77551e61b50de5c873b18b52a3bc77266e46ec52ca2cfb7b7c52414')
validpgpkeys=('0ED9020DA90D3F6E70BD3945D9625E5D7AD0177E') 

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --enable-python
  make CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}" -j$(nproc)
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim: ft=sh:ts=2:sw=2:et:nowrap
