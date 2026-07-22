# Maintainer: novica <nnovica@gmail.com>

pkgname=r-air
pkgver=0.11.0 # renovate: datasource=github-tags depName=posit-dev/air
pkgrel=1
pkgdesc="An R language server and formatter"
url="https://github.com/posit-dev/air"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=(
    libgcc
    glibc
)
conflicts=('r-air-bin')
optdepends=()
makedepends=('rust')
options=('!lto' '!debug')
source=("air-${pkgver}.tar.gz::https://github.com/posit-dev/air/archive/${pkgver}.tar.gz")

prepare() {
    cd "${srcdir}/air-${pkgver}"
    cargo fetch --locked
}

build() {
  cd "${srcdir}/air-${pkgver}"

  cargo build --release --locked
}

package() {
  install -Dm755 "${srcdir}/air-${pkgver}/target/release/air"  "${pkgdir}/usr/bin/r-air"
  install -Dm644 "${srcdir}/air-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha512sums=('0b2fd91b68999aaae46be26f8799ebab906663b9c869f83eb6ba553560f5693a06c173d69d582548931f938cc65b6947581360057feceb141b8c99b7f5e63189')
