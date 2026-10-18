# Maintainer: Julien Virey <julien.virey+aur@gmail.com>

pkgname=redmine-tui-bin
pkgver=2.0.0
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
            'c9e913c848baeb62c26b47e826a6724bcbc064b9de0aae4f7ba621a5d33dfe1a')
sha256sums_x86_64=('79dd3d4fcca6106c6b5daeaf1269906bcaace3813744701df2ae7f26187fa283')
sha256sums_aarch64=('ade8d377ae26569e4a838897140a47c211bfc0aaa1fada4fbb3468b76bfac1ca')

package() {
  case "$CARCH" in
    x86_64) _CARCH='amd64' ;;
    aarch64) _CARCH='arm64' ;;
  esac

  install -Dm755 "${pkgname%-bin}-$pkgver-$_CARCH" "$pkgdir/usr/bin/${pkgname%-bin}"
  install -Dm644 "LICENSE_$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README_$pkgver.md" "$pkgdir/usr/share/doc/${pkgname%-bin}/README.md"
}
