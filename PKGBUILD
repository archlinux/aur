# Maintainer: k88936 email: kvtodev@outlook.com

pkgname=mihomosh
pkgver=2.3.0
pkgrel=1
pkgdesc="A CLI Toolkit for Mihomo"
arch=('x86_64')
url="https://github.com/SamuNatsu/mihomosh"
license=('GPL3')
depends=('openssl')
options=(!lto)
makedepends=('cargo' 'rust' 'base-devel' 'pkg-config')
source=("git+https://github.com/SamuNatsu/mihomosh.git#tag=v${pkgver}")
sha256sums=('3ea130f61a7903a9040e13bf64d54c1fc014a79f4db1b4928ae224a9cf9782e9')

build() {
  cd "${srcdir}/${pkgname}"
  export CARGO_PROFILE_RELEASE_LTO=false
  cargo build --profile release --locked
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  # Install license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
