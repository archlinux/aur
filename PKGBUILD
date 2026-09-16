# Maintainer: Christos Longros <chris.longros@gmail.com>
pkgname=r-fsrs
pkgver=0.3.0
pkgrel=2
pkgdesc="R bindings for fsrs-rs spaced repetition algorithm (FSRS-6)"
arch=('x86_64')
url="https://github.com/open-spaced-repetition/r-fsrs"
license=('MIT')
depends=('r' 'r-r6' 'r-jsonlite')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/open-spaced-repetition/r-fsrs/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ebb8ef6e4886053335164f2f53a6327f5c5b639bccacc13b04ce3fd8570b858e')

build() {
    cd "r-fsrs-$pkgver"
    R CMD build --no-build-vignettes .
}

package() {
    cd "r-fsrs-$pkgver"
    install -dm755 "$pkgdir/usr/lib/R/library"
    R CMD INSTALL -l "$pkgdir/usr/lib/R/library" rfsrs_${pkgver}.tar.gz
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
