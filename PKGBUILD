# Maintainer: novica <nnovica@gmail.com>

pkgname=jarl
pkgver=0.7.1 # renovate: datasource=github-releases depName=etiennebacher/jarl
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

sha256sums=('f1974b1f8082fcfa44b5e9a755e8787f9fedd6aac63147714a46a29b80d85ffe')
