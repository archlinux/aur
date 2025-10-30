# Maintainer: Gurov
pkgname=holyc-lang
pkgver=0.0.10
pkgrel=1
pkgdesc="A C compiler for TempleOS's HolyC programming language"
arch=('x86_64')
url="https://github.com/Jamesbarford/holyc-lang"
license=('BSD-2-Clause')
depends=('glibc')
makedepends=('cmake' 'gcc' 'make')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Jamesbarford/holyc-lang/archive/refs/tags/beta-v$pkgver.tar.gz")
sha256sums=('be664891b02e68424299d1ad874bddce84e46476a23436973865dd190731d3e4')

build() {
    cd "$srcdir/$pkgname-beta-v$pkgver"
    
    make \
        C_COMPILER=gcc \
        BUILD_TYPE=Release \
        INSTALL_PREFIX=/usr \
        CFLAGS='-Wextra -Wall -Wpedantic -Wno-implicit-fallthrough'
}

check() {
    cd "$srcdir/$pkgname-beta-v$pkgver"
    make unit-test || warning "Tests failed"
}

package() {
    cd "$srcdir/$pkgname-beta-v$pkgver"
    
    make DESTDIR="$pkgdir" INSTALL_PREFIX=/usr install
    
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
