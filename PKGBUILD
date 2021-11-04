# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=trunk
pkgver=0.8.0
pkgrel=1
pkgdesc="Build, bundle & ship your Rust WASM application to the web."
arch=(x86_64)
url="https://github.com/thedodd/trunk/"
license=(APACHE MIT)
depends=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/thedodd/trunk/archive/v${pkgver}.tar.gz")
sha256sums=('5c5c320a42e4446292eb5f0843da86e5fa2d798b904801ce28c8295b678a83e5')

prepare() {
  cd trunk-${pkgver}
  export CARGO_HOME="${srcdir}/cargo_home"
  cargo fetch --locked
}

build() {
  cd trunk-${pkgver}
  export CARGO_HOME="${srcdir}/cargo_home"
  cargo build --release --offline --all-features --target-dir=target
}

check() {
  cd trunk-${pkgver}
  export CARGO_HOME="${srcdir}/cargo_home"
  cargo test --release --offline --all-features --target-dir=target
}

package(){
  cd trunk-${pkgver}
  find target/release -maxdepth 1 -executable -type f -exec install -Dm 755 "{}" -t "${pkgdir}"/usr/bin \;
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE-MIT
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE-APACHE
}

