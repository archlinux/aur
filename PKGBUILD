# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>

pkgname=fp
_pkgname=filterpath
pkgver=0.2.1
pkgrel=1
pkgdesc="fp (FilterPath) is the filter equivalent for the Unix test util"
arch=("x86_64" "i686" "armv7h" "aarch64")
url="https://github.com/cyqsimon/fp"
license=("MIT")
depends=("libgcc")
makedepends=("cargo")
source=("${_pkgname}-${pkgver}.tar.gz::https://static.crates.io/crates/$_pkgname/$_pkgname-$pkgver.crate")
sha512sums=('be8f59c81e386edbdd8a883ca76cb800ed76ac56984060f2de32fc8b9818498ecb2fc2e5dba241da66ab2ff9c22392a9a627cfb40a6e95397c784a9ca2bd02bd')

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
