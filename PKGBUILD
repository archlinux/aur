# Maintainer: novica <nnovica@gmail.com>

pkgname=jarl
pkgver=0.6.0 # renovate: datasource=github-tags depName=etiennebacher/jarl
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

sha256sums=('86620fcdb654d18be5f9fc62257ff577eade56cb1a6d9a3bc7d6e6857006a8a7')
