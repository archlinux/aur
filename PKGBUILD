# Maintainer: Julien Virey <julien.virey+aur@gmail.com>

pkgname=bootimus-bin
pkgver=0.1.75
pkgrel=1
pkgdesc='A Complete enhanced version of the PXE server'
arch=('x86_64' 'aarch64')
url=https://github.com/garybowers/bootimus
_rawurl="${url/github.com/raw.githubusercontent.com}/refs/tags/v$pkgver"
license=(Apache-2.0)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=(
  "LICENSE_$pkgver::$_rawurl/LICENSE"
  "README_$pkgver.md::$_rawurl/README.md"
)
source_x86_64=(
  ${pkgname%-bin}-amd64-$pkgver::$url/releases/download/v$pkgver/${pkgname%-bin}-linux-amd64
)
source_aarch64=(
  ${pkgname%-bin}-arm64-$pkgver::$url/releases/download/v$pkgver/${pkgname%-bin}-linux-arm64
)
sha256sums=('8f25b2e99b634951e318c5f648e0fc36fa567e49e000f9bee6e2a7eb94a28c16'
            '7cd2d5071da9474311edc6271283f7b4a62fda531ec9e712acaf921ea7b5c6c3')
sha256sums_x86_64=('1283e127cac67d49f5fd54eeb2754cbe5165c233f339ce3d749a446972006e91')
sha256sums_aarch64=('84b874e5edfc394640ee7ac79ea233e9dfae63ec063c40d2657fa3b854eb1d38')

case ${CARCH} in
  x86_64) _CARCH='amd64' ;;
  aarch64) _CARCH='arm64' ;;
esac

package() {
  install -Dm755 "${pkgname%-bin}-$_CARCH-$pkgver" "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 "LICENSE_$pkgver" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README_$pkgver.md" "${pkgdir}/usr/share/doc/${pkgname%-bin}/README.md"
}
