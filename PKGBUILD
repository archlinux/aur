# Maintainer: Mohammadreza Khani

pkgname=dicto
pkgver=0.1.4
pkgrel=1
pkgdesc="Minimal native dictionary app for MDX/MDD files"
arch=('x86_64')
url="https://github.com/mohamadkhani/dicto"
license=('AGPL-3.0-or-later')
depends=(
  'gtk3'
  'alsa-lib'
  'libxkbcommon'
  'xdotool'
  'hicolor-icon-theme'
)
makedepends=(
  'cargo'
  'git'
  'rust'
  'clang'
  'pkgconf'
)
optdepends=(
  'vulkan-driver: GPU rendering'
  'vulkan-intel: Intel GPU support'
)
options=(!lto)

source=("$pkgname-$pkgver.tar.gz::https://github.com/mohamadkhani/dicto/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('SKIP')

build() {
  cd "$srcdir/dicto-${pkgver}"

  export CARGO_TARGET_DIR="$srcdir/dicto-${pkgver}/target"
  cargo build --release --package dicto
}

package() {
  cd "$srcdir/dicto-${pkgver}"

  install -Dm755 "$srcdir/dicto-${pkgver}/target/release/dicto" \
    "$pkgdir/usr/bin/dicto"

  install -Dm644 "$srcdir/dicto-${pkgver}/packaging/arch/dicto.desktop" \
    "$pkgdir/usr/share/applications/dicto.desktop"

  install -Dm644 assets/icon.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/dicto.svg"

  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
