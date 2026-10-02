# Maintainer: novica <nnovica@gmail.com>

pkgname=r-air
pkgver=0.12.0 # renovate: datasource=github-tags depName=posit-dev/air
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

sha512sums=('7cf8e44b7379d430fed43780693b9f123fe16566df8c23b542082f38b0b889a8f69f85c1ff11a1cc5bbd999e6981f6d0abbd2385f8fda94be1e276634aa30e98')
