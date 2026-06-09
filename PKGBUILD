# Maintainer: Taylor Beeston <beeston.taylor@gmail.com>
pkgname=image-colorizer
pkgver=1.1.9
pkgrel=1
pkgdesc="Snap an image to a colorscheme extremely quickly"
arch=('x86_64')
url="https://github.com/TaylorBeeston/image-colorizer"
license=('MIT')
depends=('gcc-libs' 'vulkan-icd-loader')
makedepends=('rust' 'cargo' 'vulkan-headers')
optdepends=(
  'mesa: for OpenGL and Vulkan support on Intel and AMD GPUs'
  'nvidia-utils: for Vulkan support on NVIDIA GPUs'
  'vulkan-intel: for Vulkan support on Intel GPUs'
  'vulkan-radeon: for Vulkan support on AMD GPUs'
)
source=("$pkgname-$pkgver.crate::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('166384e40a25eb3a1ad5e23ec0b733a164aa76e8414e282a47daa803bfee9702')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
