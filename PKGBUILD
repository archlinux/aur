# Maintainer: Tadeusz Magura-Witkowski <tadeuszmw gmail>

pkgname=autotier
pkgver=1.2.0
pkgrel=2
pkgdesc="A passthrough FUSE filesystem that intelligently moves files between storage tiers based on frequency of use, file age, and tier fullness."
arch=('x86_64')
url="https://github.com/45Drives/autotier"
license=('GPL3')
depends=('fuse3' 'boost-libs' 'rocksdb' 'onetbb' 'lib45d')
makedepends=('gcc' 'make' 'patch' 'boost')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/45Drives/autotier/archive/refs/tags/v${pkgver}.tar.gz" "00-fix-it-make-it-work.patch" "01-missing-lists.patch")
sha256sums=('89fac0b78bf9fcbaacbb647bc5d38453ac358d69a0d041f77a269b6fb6ad10a0'
            'd78bd250e68ac93f77cc7947deec372d31d44c82807f61854645a19d326d994a'
            'd6a1a39f06945f3c263d96cc6eb7def06685c56cd9a0cb42a8d8c1f57b63f5e3')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    patch --forward --strip=1 --input="${srcdir}/00-fix-it-make-it-work.patch"
    patch --forward --strip=1 --input="${srcdir}/01-missing-lists.patch"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make EL8=1
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make install DESTDIR="$pkgdir" PACKAGING=1
}
