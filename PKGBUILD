# Maintainer: Charlotte Meyer <me@buffets.email>

pkgname=yolk
pkgver=0.2.0
pkgrel=1
pkgdesc="Templated dotfile management that won't get in your way"
arch=("x86_64")
url="https://elkowar.github.io/yolk/"
license=("MIT")
depends=("gcc-libs" "git" "glibc")
makedepends=("cargo")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ElKowar/yolk/archive/v${pkgver}.tar.gz")
b2sums=('7ee4d607a178cbe58334c8fdea788669d8fa7403aeb7e33d65e6b621eba4fecd8ec80a054533132af93162760a2d97f94023c25255383ecfd682e8be8ce4ebad')

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
