# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>

pkgname=wasm-server-runner
pkgver=0.5.1
pkgrel=1
pkgdesc="cargo run for the browser."
arch=("x86_64" "i686" "armv6h" "armv7h" "aarch64")
url="https://github.com/jakobhellermann/wasm-server-runner"
license=("MIT")
depends=("cargo")
source=("${pkgname}-${pkgver}.tar.gz::https://static.crates.io/crates/${pkgname}/${pkgname}-${pkgver}.crate")
b2sums=('0631be2e279780dc62df88ed5f904467105d916199bd34b7ba8a2537ea926e5f292a910acf274652aa7a637ed20caa807c2cfa244e958c080a30ab7d40d82695')

prepare() {
  cd ${pkgname}-${pkgver}
  cargo fetch --locked
}

build() {
  cd ${pkgname}-${pkgver}
  cargo build --release --frozen
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm 755 -t "${pkgdir}/usr/bin" target/release/${pkgname}
  install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.md
}
