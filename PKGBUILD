# Maintainer: zyx <d0116u@gmail.com>
pkgname=authtui-git
pkgver=1.0.1
pkgrel=1
pkgdesc="a full rust tui auther"
arch=('i686' 'x86_64')
url="https://github.com/d116u/authtui"
license=('MIT')
provides=("authtui")
makedepends=('cargo' 'git')
optdepends=('fish: fish completions')
depends=('rust')
conflicts=("authtui")
source=("https://github.com/d116u/authtui/archive/refs/heads/main.zip")
sha1sums=('SKIP')

build() {
  #git clone https://github.com/d116u/authtui.git
  cd "authtui-main"
  if command -v rustup > /dev/null 2>&1; then
    RUSTFLAGS="-C target-cpu=native" rustup run nightly \
      cargo build --release
  elif rustc --version | grep -q nightly; then
    RUSTFLAGS="-C target-cpu=native" \
      cargo build --release
  else
    cargo build --release
  fi
}


package() {
  cd "authtui-main"
  install -Dm755 "target/release/auther" "$pkgdir/usr/bin/authtui"
}
