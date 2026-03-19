pkgname='prman'
pkgver='1.0.2'
pkgrel=1
pkgdesc='Terminal-first project repository manager.'
arch=('x86_64')
url='https://github.com/bencetotht/prm'
license=('MIT' 'Apache-2.0')
depends=('git')
makedepends=('cargo' 'rust')
optdepends=(
  'lazygit: open lazygit with the g shortcut'
  'tmux: popup and terminal-window integrations'
)
conflicts=('prman-bin' 'prm')
source=("prman-1.0.2.tar.gz::https://github.com/bencetotht/prm/archive/refs/tags/v1.0.2.tar.gz")
sha256sums=('1758b4f994ecfe96f44f3ccf725729195331efddcc8482b26900ae64307ee9cb')

prepare() {
  cd "prm-1.0.2"
  export CARGO_HOME="${srcdir}/cargo-home"
  cargo fetch --locked
}

build() {
  cd "prm-1.0.2"
  export CARGO_HOME="${srcdir}/cargo-home"
  export CARGO_TARGET_DIR=target
  export PRM_RELEASE_VERSION="1.0.2"
  cargo build --frozen --release
}

check() {
  cd "prm-1.0.2"
  export CARGO_HOME="${srcdir}/cargo-home"
  export CARGO_TARGET_DIR=target
  export PRM_RELEASE_VERSION="1.0.2"
  cargo test --frozen --all-targets
}

package() {
  cd "prm-1.0.2"
  install -Dm755 "target/release/prm" "${pkgdir}/usr/bin/prm"
  install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/prman/LICENSE-MIT"
  install -Dm644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/prman/LICENSE-APACHE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/prman/README.md"
}
