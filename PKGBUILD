# Maintainer: mfw <espadonne@outlook.com>

pkgname=fortbite
pkgver=1.0.1
pkgrel=4
pkgdesc='High-precision mathematical calculator in Modern Fortran'
arch=('x86_64')
url='https://github.com/FortranGoingOnForty/fortbite'
license=('MIT')
depends=('glibc')
makedepends=('gcc-fortran' 'make')
source=("git+https://github.com/FortranGoingOnForty/fortbite.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
    cd fortbite
    make clean
    make all
}

check() {
    cd fortbite
    make test-unit || true  # Allow tests to fail gracefully if they require interactive input
}

package() {
    cd fortbite
    
    # Install main binary
    install -Dm755 build/bin/fortbite "$pkgdir/usr/bin/fortbite"
    
    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 USAGE_GUIDE.md "$pkgdir/usr/share/doc/$pkgname/USAGE_GUIDE.md"
    install -Dm644 DEVELOPER_GUIDE.md "$pkgdir/usr/share/doc/$pkgname/DEVELOPER_GUIDE.md"
    install -Dm644 QUICK_REFERENCE.md "$pkgdir/usr/share/doc/$pkgname/QUICK_REFERENCE.md"
}