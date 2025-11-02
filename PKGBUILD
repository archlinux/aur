# Maintainer: Coral Pink <coral.pink@disr.it>
pkgname=cb3sum
pkgver=0.2.0
pkgrel=1
pkgdesc='BLAKE3 checksums'
url='https://codeberg.org/coralpink/cb3sum'
arch=('x86_64' 'aarch64')
license=('GPL-3.0-or-later' 'FSFAP' 'Apache-2.0')
depends=('glibc' 'libblake3')
checkdepends=('bash')
source=(
    "$pkgname-$pkgver.tar.gz::https://codeberg.org/coralpink/cb3sum/releases/download/$pkgver/$pkgname-$pkgver.tar.gz"
    "$pkgname-$pkgver.tar.gz.sig::https://codeberg.org/coralpink/cb3sum/releases/download/$pkgver/$pkgname-$pkgver.tar.gz.sig"
)
b2sums=(
    '12901e15c63810743e69df3f75c7984d9f5b3d3b9362de7ce0c935524ea4fd2b112be1ea3c26b3a56d253297e8356a79bf0604a7866ca1bdbad7a0959aab0bc5'
    'd9f04cfb9114078e425bdd77632597bdebe32af7927a2df7ed74b0951e02d7fd6dea1f2cae6b2bf58c9a6f2092596ea7588ae5b238691d6ecea69d077b36d7d8'
)
validpgpkeys=('88CF318EE94748D582940E86CC5693B9689DB487')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    make check
}
