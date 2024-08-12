# Maintainer: Taylor Beeston <beeston.taylor@gmail.com>
pkgname=image-colorizer
pkgver=1.1.4
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
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha256sums=('8de8eb1c361c6b470441e30147c5216bc03c657b2f0cb150926d93efaa616a10')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
