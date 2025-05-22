# Maintainer: Stipe Kotarac <stipe@kotarac.net>

pkgname=paip
pkgver=0.1.3
pkgrel=1
pkgdesc='like cat but through llm'
url='https://github.com/kotarac/paip'
arch=(x86_64)
license=(GPL-2.0-only)
makedepends=(cargo)
options=(!lto)
source=("https://github.com/kotarac/paip/archive/v${pkgver}.tar.gz")
sha256sums=('d1552b196653393e5233e42cbf5d92c047bd660e9fb20a101c2f1791f985b2c2')

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
