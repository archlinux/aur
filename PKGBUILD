# Maintainer: mestik78 <mestik78@gmail.com>

pkgname=pyroclear
pkgver=1.2.2
pkgrel=1
pkgdesc="Clear your terminal with a crackling wall of ASCII flames."
arch=('x86_64')
url="https://github.com/shreyanth-sureshkrishnaa/pyroclear"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/shreyanth-sureshkrishnaa/pyroclear/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('06d2080ffe0bcd7d1a53e2bc2e01cd8ea295dc939c9442896fb7b2a1ae89ce8b')

prepare() {
    cd "${pkgname}-${pkgver}"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${pkgname}-${pkgver}"
    cargo build --frozen --release --all-features
}

check() {
    cd "${pkgname}-${pkgver}"
    cargo test --frozen --all-features
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
