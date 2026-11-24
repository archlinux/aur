# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=desktop-tui
pkgver=0.3.2
pkgrel=1
pkgdesc="Desktop environment in the terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/julien-cpsn/desktop-tui"
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('fd83f9fd836f602e26e146b61b4d59620d18faada95f3e6770d9164f776b9421')

prepare() {
  cd "desktop-tui-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "desktop-tui-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "desktop-tui-${pkgver}"
  install -Dm755 "target/release/desktop-tui" "${pkgdir}/usr/bin/desktop-tui"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
