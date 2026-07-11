# Maintainer: Julien Virey <julien.virey+aur@gmail.com>

pkgname=bootimus-bin
pkgver=0.1.70
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
            'c8304a413a6babab68764f1b57545c4c4f528776fcda784da24ef8e8f86d359c')
sha256sums_x86_64=('bd6bb20064a96e74fb21604372041b7d1ca6ece905677a5ca65db0deda60428b')
sha256sums_aarch64=('9ae32dc6caa0800916c75cc46a646c88b38bdf0831b9529df2b725200640bc92')

case ${CARCH} in
  x86_64) _CARCH='amd64' ;;
  aarch64) _CARCH='arm64' ;;
esac

package() {
  install -Dm755 "${pkgname%-bin}-$_CARCH-$pkgver" "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 "LICENSE_$pkgver" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README_$pkgver.md" "${pkgdir}/usr/share/doc/${pkgname%-bin}/README.md"
}
