# Maintainer: GI_Jack <GI_Jack@hackermail.com>
pkgname=pidgin-wechat
pkgver=0.1.1
pkgrel=2
pkgdesc="WeChat protocol plugin for pidgin/libpurple. Based on Web Wechat and supports basic message receiving and picture receiving."
arch=('i686' 'x86_64')
url="https://github.com/sbwtw/pidgin-wechat"
license=('WTFPL')
depends=('libpurple')
makedepends=('rust' 'clang' 'libpurple')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/sbwtw/pidgin-wechat/archive/${pkgver}.tar.gz")
sha256sums=('d54ef61822b94ae9b67520adbee99a0648b763f63b9f948d361c1772a3355d9f')

prepare() {
  cd "${pkgname}-${pkgver}"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 target/release/deps/libwechat.so ${pkgdir}/usr/lib/pidgin/libwechat.so
}

