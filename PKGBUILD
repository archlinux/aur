pkgname=labyrinthine
pkgver=0.1.1
pkgrel=1
pkgdesc="Linux-first Rust terminal maze runner with Q-learning, auto-solving, and progressive levels"
arch=('x86_64')
url="https://github.com/xeoxaz/Labyrinthine"
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
optdepends=(
  'nvidia-utils: enable CUDA probing via nvidia-smi'
  'rocminfo: enable ROCm probing'
  'vulkan-tools: enable Vulkan probing'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/xeoxaz/Labyrinthine/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('SKIP')

build() {
  cd "$srcdir/Labyrinthine-$pkgver"
  cargo build --locked --release
}

check() {
  cd "$srcdir/Labyrinthine-$pkgver"
  cargo test --locked
}

package() {
  cd "$srcdir/Labyrinthine-$pkgver"

  install -Dm755 "target/release/labyrinthine" "$pkgdir/usr/bin/labyrinthine"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}