# Maintainer: Gaoyang Zhang <gy@blurgy.xyz>
pkgname=dt-cli
pkgver=0.7.9
pkgrel=1
epoch=
pkgdesc="Dotfile management and templating client"
arch=("any")
url="https://dt.cli.rs"
license=('MIT OR Apache 2.0')
groups=()
depends=()
makedepends=(
  'rust'
  'cargo'
  'git'
)
checkdepends=()
optdepends=()
provides=("dt-cli")
conflicts=("dt-cli-git" "dt-cli-bin")
replaces=()
backup=()
options=()
install=
changelog=
source=(
  "https://github.com/blurgyy/dt/archive/refs/tags/v${pkgver}.tar.gz"
)
b2sums=(
  '43a3f5f26c70b486b467b96b19d71f8257ec88d4ac11736f91a223b772d8bf525852271d9fd94bbdbdb2a7908da9f7a15c9e3d96a2fdceb7f38c2230891b3511'
)
noextract=()
validpgpkeys=()

build() {
  cd "dt-$pkgver"
  cargo +stable build --bin=dt-cli --release --all-features --locked
}

check() {
  cd "dt-$pkgver"
  cargo +stable test --lib --release --all-features --locked
}

package() {
  cd "dt-$pkgver"
  install -Dm755 "target/release/dt-cli" "$pkgdir/usr/bin/dt-cli"
  install -Dm644 "LICENSE-APACHE" "$pkgdir/usr/share/licenses/dt/LICENSE-APACHE"
  install -Dm644 "LICENSE-MIT" "$pkgdir/usr/share/licenses/dt/LICENSE-MIT"
}
