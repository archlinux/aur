# Maintainer: LIghtJUNction <lightjunction@users.noreply.github.com>

pkgname=cortexfs-git
pkgver=0.1.0.r78.g52e12af
pkgrel=1
pkgdesc="Provider-neutral AI API FUSE filesystem"
arch=('x86_64')
url="https://github.com/LIghtJUNction/cortexfs"
license=('MIT')
depends=('fuse3' 'libgcc')
makedepends=('cargo' 'git')
provides=('cortexfs' 'cortex-cli')
conflicts=('cortexfs' 'cortex-cli')
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
  cargo build --release --locked -p cortex-cli
}

package() {
  cd "$srcdir/cortexfs"
  install -Dm755 target/release/cortex "$pkgdir/usr/bin/cortex"
  install -Dm644 packaging/systemd/cortexfs@.service "$pkgdir/usr/lib/systemd/system/cortexfs@.service"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
