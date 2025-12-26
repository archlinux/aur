# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Sasasu (i@sasa.su)

pkgname=libkmip
pkgver=0.2.0
pkgrel=2
pkgdesc='C implementation of the KMIP specification'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/OpenKMIP/libkmip'
license=('Apache-2.0' 'BSD-3-Clause')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        '001-Makefile.patch')
sha256sums=('d9f9baacf8aabd7399be7f39aca232ac3eea9b4c7582e6f7115b88efbb41ab8a'
            '91d1e34310494faaa744ea5f2607d4c31220c9553a1cf0cc3021fc66182ee571')

prepare() {
  cd "$pkgname-$pkgver"
  patch -p1 < "$srcdir/001-Makefile.patch"
}

build() {
  cd "$pkgname-$pkgver"
  make PREFIX=/usr
}

package() {
  cd "$pkgname-$pkgver"
  make install PREFIX=/usr DESTDIR="$pkgdir"
  install -Dm644 LICENSE* -t "$pkgdir/usr/share/licenses/$pkgname/"
}

