# Maintainer: seth <getchoo at tuta dot io>

pkgname=joshuto
pkgver=0.9.6
pkgrel=2
pkgdesc="ranger-like terminal file manager written in Rust"
arch=('x86_64')
url="https://github.com/kamiyaa/joshuto"
license=('LGPL3')
makedepends=('cargo')
optdepends=(
        'fzf: for better file searching'
        'xclip: for clipboard support on X11'
        'xsel: for clipboard support on X11'
        'wl-clipboard: for clipboard support on Wayland'
        'zoxide: for use in cd functions'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kamiyaa/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('78d03e0c7971fe715da7e89c6e848112eedb993f04625e720997156c74578d42')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cargo build --frozen --release --all-features 
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
