# Maintainer: Charlotte Meyer <me@buffets.email>

pkgname=yolk
pkgver=0.1.0
pkgrel=1
pkgdesc="Templated dotfile management that won't get in your way"
arch=("x86_64")
url="https://elkowar.github.io/yolk/"
license=("MIT")
depends=("gcc-libs" "git" "glibc")
makedepends=("cargo")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ElKowar/yolk/archive/v${pkgver}.tar.gz")
b2sums=('2e7898cae9d5d0243f05f3355a34d96e3e5cd0be2615eb8a4ddd25a0021a1e4e55e84f5adafeb6b681d988fc28c530db79db2a7ecb73e0e853293ccf72c07f13')

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
