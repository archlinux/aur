# Maintainer: LIghtJUNction <lightjunction@users.noreply.github.com>

pkgname=cortexfs-git
pkgver=0.1.0.r92.g6b25ae8
pkgrel=1
pkgdesc="CortexFS v1 Agent OS ABI core and CLI"
arch=('x86_64')
url="https://github.com/LIghtJUNction/cortexfs"
license=('MIT')
depends=('fuse3' 'libgcc')
makedepends=('cargo' 'git')
provides=('cortexfs' 'ctx')
conflicts=('cortexfs' 'ctx')
source=(
  'git+https://github.com/LIghtJUNction/cortexfs.git'
  'LICENSE'
)
sha256sums=(
  'SKIP'
  'SKIP'
)

pkgver() {
  cd "$srcdir/cortexfs"
  printf "0.1.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir/cortexfs"
  cargo build --release --locked -p cortexfs
}

package() {
  cd "$srcdir/cortexfs"
  install -Dm755 target/release/ctx "$pkgdir/usr/bin/ctx"
  install -Dm755 target/release/cortexfs-mount "$pkgdir/usr/bin/cortexfs-mount"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 docs/DESIGN.md "$pkgdir/usr/share/doc/$pkgname/DESIGN.md"
  cp -R docs/spec "$pkgdir/usr/share/doc/$pkgname/spec"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
