# Maintainer: Charlotte Meyer <me@buffets.email>

pkgname=yolk
pkgver=0.2.2
pkgrel=1
pkgdesc="Templated dotfile management that won't get in your way"
arch=("x86_64")
url="https://elkowar.github.io/yolk/"
license=("MIT")
depends=("gcc-libs" "git" "glibc")
makedepends=("cargo")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ElKowar/yolk/archive/v${pkgver}.tar.gz")
b2sums=('fbbb266aa83cc63304af6318e942ba6748153a9ada9ea1af09a1d35f256f2fbe1e5a54dbee427d177eb366ff13fdf833f01e298be8ab0b99c2db975c78c8cccc')

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
