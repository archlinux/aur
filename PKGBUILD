# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

## PGP key: https://github.com/joachimmetz.gpg

pkgname=libbde
pkgver=20220121
pkgrel=1
pkgdesc="Library and tools for accessing BitLocker Drive Encryption (BDE) encrypted volumes"
url="https://github.com/libyal/libbde"
arch=('x86_64')
license=('GPL3')
depends=('openssl' 'libcrypt.so')
makedepends=('python')
optdepends=('fuse: bdemount support')
provides=('libbde.so' 'pybde.so' 'python-pybde')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/libbde-alpha-$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::$url/releases/download/$pkgver/libbde-alpha-$pkgver.tar.gz.asc")
sha256sums=('76748cb939bf9cc899eaddab6e10ea1a9a7f7bdc6de4cb33d889fc7a2b938c2f'
            'SKIP')
validpgpkeys=('0ED9020DA90D3F6E70BD3945D9625E5D7AD0177E') # Joachim Metz

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --enable-python
  make CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}"
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim: ft=sh:ts=2:sw=2:et:nowrap
