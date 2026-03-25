# Maintainer: novica <nnovica@gmail.com>

pkgname=jarl
pkgver=0.5.0
pkgrel=1
pkgdesc="Fast linter for the R language"
arch=('x86_64' 'aarch64')
url="https://github.com/etiennebacher/jarl"
license=('MIT')
depends=('gcc-libs' 'glibc' 'zlib')
conflicts=('jarl-bin')
optdepends=()
makedepends=('rust')
options=('!lto' '!debug')
provides=("jarl=${pkgver}")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/etiennebacher/jarl/archive/${pkgver}.tar.gz")

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cargo fetch --locked
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  cargo build --release --locked
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/target/release/jarl"  "${pkgdir}/usr/bin/jarl"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha256sums=('7b1fd11adc3924fa71f3a4202a2a4a87f1c8d62944160adedba65eb8f01d1cda')
