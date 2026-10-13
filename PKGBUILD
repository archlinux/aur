# Maintainer: Julien Virey <julien.virey+aur@gmail.com>

pkgname=bootimus-bin
pkgver=0.1.77
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
            'b4df4b8bab4141b28bd68e438fcfb107b1f841a02cdbc720d9c35382db407e55')
sha256sums_x86_64=('8af31961b0ae7db60c40f7c4214a6b71e2360ed5bfa31378e7699f3e467c5fca')
sha256sums_aarch64=('f6e46754168952c6c887865d10d185040b63bde38687ce0ed94c0b7bceeef113')

case ${CARCH} in
  x86_64) _CARCH='amd64' ;;
  aarch64) _CARCH='arm64' ;;
esac

package() {
  install -Dm755 "${pkgname%-bin}-$_CARCH-$pkgver" "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 "LICENSE_$pkgver" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README_$pkgver.md" "${pkgdir}/usr/share/doc/${pkgname%-bin}/README.md"
}
