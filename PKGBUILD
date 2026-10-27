# Maintainer: Julien Virey <julien.virey+aur@gmail.com>

pkgname=bootimus-bin
pkgver=0.1.79
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
            '09571218530d76891ed748e7ff1254009dba3aff61b7fb8645dc96f430dfbd7b')
sha256sums_x86_64=('9bada34a72db1fbf72824dd9e2932cc49c869bcb6a03a5e14a5b4bb736a6e04e')
sha256sums_aarch64=('69488637253aec30855babfbf362fc984b51e5a8131867a32186613a386c902f')

case ${CARCH} in
  x86_64) _CARCH='amd64' ;;
  aarch64) _CARCH='arm64' ;;
esac

package() {
  install -Dm755 "${pkgname%-bin}-$_CARCH-$pkgver" "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 "LICENSE_$pkgver" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README_$pkgver.md" "${pkgdir}/usr/share/doc/${pkgname%-bin}/README.md"
}
