# Maintainer: Julien Virey <julien.virey+aur@gmail.com>

pkgname=redmine-tui-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Terminal UI for Redmine: kanban board, time logging, status updates"
arch=('x86_64' 'aarch64')
url="https://github.com/omertahaoztop/redmine-tui"
_rawurl="${url/github.com/raw.githubusercontent.com}/refs/tags/v$pkgver"
license=('MIT')
depends=(glibc)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=(
  "LICENSE_$pkgver::$_rawurl/LICENSE"
  "README_$pkgver.md::$_rawurl/README.md"
)
source_x86_64=(
  ${pkgname%-bin}-$pkgver-amd64::$url/releases/download/v$pkgver/${pkgname%-bin}-linux-amd64
)
source_aarch64=(
  ${pkgname%-bin}-$pkgver-arm64::$url/releases/download/v$pkgver/${pkgname%-bin}-linux-arm64
)
sha256sums=('fa6e367c84868f077317c6826b12a66e47ed688d5944666b5ff26b3a2f4ea3c3'
            'd18848c3ed13b00c7135368c5e6aadc033470907e6517d8a424be4c3c8833f6f')
sha256sums_x86_64=('e5a46f9b0170b23b6040077be1eea7b815a1dc03737f442c249484b90344818c')
sha256sums_aarch64=('9f74de3a305ffe8954805d2059227d2c7132cf8900904df8d273052e98c8714d')

package() {
  case "$CARCH" in
    x86_64) _CARCH='amd64' ;;
    aarch64) _CARCH='arm64' ;;
  esac

  install -Dm755 "${pkgname%-bin}-$pkgver-$_CARCH" "$pkgdir/usr/bin/${pkgname%-bin}"
  install -Dm644 "LICENSE_$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README_$pkgver.md" "$pkgdir/usr/share/doc/${pkgname%-bin}/README.md"
}
