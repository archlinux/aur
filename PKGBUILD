# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>

pkgname=fp
_pkgname=filterpath
pkgver=0.1.3
pkgrel=1
pkgdesc="fp (FilterPath) is the filter equivalent for the Unix test util"
arch=("x86_64" "i686" "armv7h" "aarch64")
url="https://github.com/cyqsimon/fp"
license=("MIT")
depends=("libgcc")
makedepends=("cargo")
source=("${_pkgname}-${pkgver}.tar.gz::https://static.crates.io/crates/$_pkgname/$_pkgname-$pkgver.crate")
sha512sums=('9bad03c4e14b42d08dbcb730895cfd492b036ab9a6e3f43dca537d3b2d633fc01c3a126449663ddc1dc5657f784b7ee1cf1d80042e83463c4632e69e38724256')

prepare() {
  cd ${_pkgname}-${pkgver}
  cargo fetch --locked
}

build() {
  cd ${_pkgname}-${pkgver}
  cargo build --release --frozen --all-features
}

package() {
  cd ${_pkgname}-${pkgver}
  install -Dm755 target/release/fp "${pkgdir}/usr/bin/fp"
  install -Dm644 target/release/build/${_pkgname}-*/out/fp.bash "${pkgdir}/usr/share/bash-completion/completions/fp"
  install -Dm644 target/release/build/${_pkgname}-*/out/fp.fish "${pkgdir}/usr/share/fish/vendor_completions.d/fp.fish"
  install -Dm644 target/release/build/${_pkgname}-*/out/_fp "${pkgdir}/usr/share/zsh/site-functions/_fp"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
