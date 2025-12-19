# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=hys
pkgver=0.1.2
pkgrel=1
pkgdesc="Terminal RSS Reader for Digital Minimalists in Zig — Tool for Escaping the Doomscroll"
url="https://github.com/superstarryeyes/hys"
arch=('i686' 'x86_64')
license=('MIT')
options=()
depends=('curl')
makedepends=(zig)
install=
provides=(hys)
source=("https://github.com/superstarryeyes/$pkgname/archive/refs/tags/v$pkgname_$pkgver.tar.gz")
sha256sums=('38340bf3bd5392b0944b23114719f7d5bf1420a0dcdab05e41c190aaa8a62bf4')

build() {
  cd "$pkgname-$pkgver" || exit 1
  zig build -Doptimize=ReleaseSafe
}

package() {
  cd "$pkgname-$pkgver" || exit 1
  # shellcheck disable=SC2154
  install -Dm755 zig-out/bin/hys "$pkgdir/usr/bin/hys"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
