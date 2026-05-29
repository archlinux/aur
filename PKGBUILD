# Maintainer: k88936 email: kvtodev@outlook.com

pkgname=mihomosh
pkgver=2.3.2
pkgrel=0
pkgdesc="A CLI Toolkit for Mihomo"
arch=('x86_64')
url="https://github.com/SamuNatsu/mihomosh"
license=('GPL3')
depends=('openssl')
options=(!lto)
makedepends=('cargo' 'rust' 'base-devel' 'pkg-config')
source=("git+https://github.com/SamuNatsu/mihomosh.git#tag=v${pkgver}")
sha256sums=('5c71a6147d8b62eb3bd0de62e991847296cf0a58b5165cfeab3b8acb0b7e592c')

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
