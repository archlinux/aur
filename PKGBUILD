# Maintainer: Stipe Kotarac <stipe@kotarac.net>

pkgname=paip
pkgver=0.1.4
pkgrel=1
pkgdesc='like cat but through llm'
url='https://github.com/kotarac/paip'
arch=(x86_64)
license=(GPL-2.0-only)
makedepends=(cargo)
options=(!lto)
source=("https://github.com/kotarac/paip/archive/v${pkgver}.tar.gz")
sha256sums=('b223a951ec903cb533390905dc9abc3b3c23e3fc57b4eeb1e1746799c3c00c78')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}/"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build () {
  cd "${srcdir}/${pkgname}-${pkgver}/"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --frozen --release
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}/"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --release
}

package() {
  install -m755 -D "${srcdir}/${pkgname}-${pkgver}/target/release/paip" "${pkgdir}/usr/bin/paip"
  install -m644 -D "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
