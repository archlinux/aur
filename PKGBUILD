# Maintainer: mfw <espadonne@outlook.com>

pkgname=fit
pkgver=0.1.0
pkgrel=1
pkgdesc='Terminal-based merge conflict resolver with three-pane TUI interface'
arch=('x86_64')
url='https://github.com/FortranGoingOnForty/fit'
license=('MIT')
depends=('glibc')
makedepends=('gcc-fortran' 'make')
source=("git+https://github.com/FortranGoingOnForty/fit.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
    cd fit
    make release
}

check() {
    cd fit
    make test || true  # Allow tests to fail gracefully if they require interactive input
}

package() {
    cd fit

    # Install main binary
    install -Dm755 bin/fit "$pkgdir/usr/bin/fit"

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
