# Maintainer: Algorant
pkgname=tandem-bin
pkgver=0.4.2
pkgrel=1
pkgdesc='Local-first CLI/TUI for human and agent project coordination (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/Algorant/tandem'
license=('MIT')
depends=('gcc-libs' 'glibc')
provides=('tandem')
conflicts=('tandem')
options=('!debug')

source_x86_64=("tandem-x86_64-unknown-linux-gnu-$pkgver.tar.xz::$url/releases/download/tandem-v$pkgver/tandem-x86_64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('9037055f92537b01bd82c2ba6927c56ed491d4363e75818e3694234c64c7d279')

source_aarch64=("tandem-aarch64-unknown-linux-gnu-$pkgver.tar.xz::$url/releases/download/tandem-v$pkgver/tandem-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_aarch64=('0848d11ee8fed256739ab305611965dd2133624ead33954e31b467d1275b95a7')

package() {
  local target
  case "$CARCH" in
    x86_64) target='x86_64-unknown-linux-gnu' ;;
    aarch64) target='aarch64-unknown-linux-gnu' ;;
    *) echo "Unsupported architecture: $CARCH" >&2; return 1 ;;
  esac

  cd "tandem-$target"
  install -Dm755 tandem "$pkgdir/usr/bin/tandem"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
