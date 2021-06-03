pkgname=banano-vanity
pkgver=1.41
pkgrel=2
pkgdesc="A vanity address generator for banano cryptocurrency"
arch=('x86_64')
source=("git+https://github.com/flammenderdrache/banano-vanity.git")
url="https://github.com/flammenderdrache/banano-vanity"
sha512sums=('SKIP')
makedepends=(
   'rust'
   'cargo'
   'git'
   'ocl-icd'
)

build() {
    cd "${srcdir}/${pkgname}"
    cargo build --release --features gpu --locked
}

check() {
    cd "${srcdir}/${pkgname}"
    cargo test --release --features gpu --locked
}

package() {
    cd "${srcdir}/${pkgname}"
    install -Dm 755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

