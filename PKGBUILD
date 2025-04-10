pkgname=tempesta
pkgver=0.0.65
pkgrel=1
pkgdesc="The fastest and lightest bookmark manager CLI written in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/x71c9/tempesta"
license=('MIT')
depends=('glibc')
optdepends=('fzf' 'wofi')
makedepends=('cargo')

case "$arch" in
  "x86_64")
    source+=(${pkgname}-${pkgver}-${arch}::"https://github.com/x71c9/tempesta/releases/download/v${pkgver}/tempesta-${arch}-unknown-linux-gnu.tar.gz")
    sha256sums=('SKIP')
    ;;
  "aarch64")
    source+=(${pkgname}-${pkgver}-${arch}::"https://github.com/x71c9/tempesta/releases/download/v${pkgver}/tempesta-${arch}-unknown-linux-gnu.tar.gz")
    sha256sums=('SKIP')
    ;;
  *)
    echo "Error: Unsupported architecture $arch. Please open a github issue if you want to support it: https://github.com/x71c9/tempesta/issues" >&2
    exit 1
    ;;
esac

prepare() {
  cd "-"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target ""
}

build() {
  cd "-"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
} 
package() {
  cd "-"
  install -Dm0755 -t "/usr/bin/" "target/release/"
}
