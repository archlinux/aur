# Maintainer: Taylor Beeston <beeston.taylor@gmail.com>
pkgname=image-colorizer
pkgver=1.0.1
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
  'wgpu-git: WebGPU implementation (AUR)'
)
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha256sums=('11ccc0c2a4e8b1ec5d16785b7b75ec22a33bc979a310a879deb2f29b7574e08e')  # This will be replaced with the actual checksum in CI

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
