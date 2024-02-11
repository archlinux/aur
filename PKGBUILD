# Maintainer: Tadeusz Magura-Witkowski <tadeuszmw gmail>

pkgname=autotier
pkgver=1.2.0
pkgrel=1
pkgdesc="A passthrough FUSE filesystem that intelligently moves files between storage tiers based on frequency of use, file age, and tier fullness."
arch=('x86_64')
url="https://github.com/45Drives/autotier"
license=('GPL3')
depends=('fuse3' 'boost-libs' 'rocksdb' 'onetbb' 'lib45d')
makedepends=('gcc' 'make' 'patch')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/45Drives/autotier/archive/refs/tags/v${pkgver}.tar.gz" "00-fix-it-make-it-work.patch")
sha1sums=('1989365b7b70319209d0017d22aa23f129509809'
          '6a68d5b18799990ac6430294c6af6b255e1686f7')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    patch --forward --strip=1 --input="${srcdir}/00-fix-it-make-it-work.patch"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make EL8=1
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make install DESTDIR="$pkgdir" PACKAGING=1
}
