# Maintainer: Adrián Arroyo Calle <adrian.arroyocalle@gmail.com>
# Contributor: Jef Roosens

pkgname=scryer-prolog
pkgver=0.9.2
pkgrel=2
pkgdesc="An open source industrial strength production environment that is also a testbed for bleeding edge research in logic and constraint programming"
arch=('aarch64' 'x86_64')
url="https://github.com/mthom/scryer-prolog"
license=('BSD-3-Clause')
depends=('openssl' 'libmpc' 'mpfr' 'gmp' 'gcc-libs' 'glibc')
makedepends=('cargo')
source=("https://github.com/mthom/scryer-prolog/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d8e89e0d6c54fdd34104513e231bba4c8499659b1dd3ae6abe187606e443a82c')

export CARGO_PROFILE_RELEASE_LTO="true"
export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
export CARGO_PROFILE_RELEASE_OPT_LEVEL="s"

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo fetch --locked
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release --frozen
}

check() {
    cd "$srcdir/$pkgname-$pkgver"    
    cargo test --release --frozen
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    mkdir -p "$pkgdir/usr/bin"
    install -Dm755 target/release/scryer-prolog -t "$pkgdir"/usr/bin
}
