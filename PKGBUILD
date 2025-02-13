# Maintainer: Charlotte Meyer <me@buffets.email>

pkgname=yolk
pkgver=0.3.2
pkgrel=1
pkgdesc="Templated dotfile management that won't get in your way"
arch=("x86_64")
url="https://elkowar.github.io/yolk/"
license=("MIT")
depends=("gcc-libs" "git" "glibc")
makedepends=("cargo")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ElKowar/yolk/archive/v${pkgver}.tar.gz")
b2sums=('219fb239dcb4bde84359dafaafd3bfa645ef1e54d3f32ca9b218f7c16fba843c4f2f64d6d330408a52d7c10bfa3dbef9446c6c3f3dd44c58164406c3dcc34cb7')

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
