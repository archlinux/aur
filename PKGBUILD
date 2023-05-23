# Maintainer: replydev <commoncargo@tutanota.com>

pkgname=cotp
pkgver=1.2.5
pkgrel=1
pkgdesc='Trustworthy, encrypted, command-line TOTP/HOTP authenticator app with import functionality.'
arch=('x86_64')
url='https://github.com/replydev/cotp'
license=('GPL3')
makedepends=('cargo' 'python')
depends=('libxcb' 'libxkbcommon-x11')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ecfa11c2452dffa7112942607e4e99a969e0378c122703779858077f946fb144')
conflics=('cotp-bin')
provides=('cotp-bin')

prepare(){
  cd "$pkgname-$pkgver"
  cargo update
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
}
