# Maintainer: nihitdev
pkgname=zay-git
pkgver=0.r12.g31ddd4b
pkgrel=1
pkgdesc='Pacman with native AUR awareness'
arch=('x86_64')
url='https://github.com/nihitdev/zay'
license=('GPL-3.0-or-later')
depends=('glibc' 'pacman')
makedepends=('git' 'zig')
provides=('zay')
conflicts=('zay')
source=('zay::git+https://github.com/nihitdev/zay.git#branch=main')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/zay"
  printf '0.r%s.g%s\n' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir/zay"
  zig build -Doptimize=ReleaseFast
}

package() {
  cd "$srcdir/zay"
  install -Dm755 zig-out/bin/zay "$pkgdir/usr/bin/zay"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
