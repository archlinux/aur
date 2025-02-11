# Maintainer: Charlotte Meyer <me@buffets.email>

pkgname=yolk
pkgver=0.3.1
pkgrel=1
pkgdesc="Templated dotfile management that won't get in your way"
arch=("x86_64")
url="https://elkowar.github.io/yolk/"
license=("MIT")
depends=("gcc-libs" "git" "glibc")
makedepends=("cargo")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ElKowar/yolk/archive/v${pkgver}.tar.gz")
b2sums=('de6d65c33988511465420ca94ac49a06f9f99ae6a75f23c470ff98e9fc6f39331b2e381e406ae51b347862a1a14de50f7a6e2531fe0aa8ee77c58b12c1e385ac')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's|host: ||p')"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --frozen --release --target-dir target
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 target/release/yolk -t "${pkgdir}/usr/bin/"
}
