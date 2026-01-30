# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor: Yvaniak <ewen at philippot dot biz>
# Contributor: Benjamin Denhartog <ben@sudoforge.com>

pkgname=buildifier-bin
pkgver=8.5.1
pkgrel=1
pkgdesc='A command line tool to format Bazel BUILD files'
arch=('x86_64' 'aarch64')
license=('Apache')
url='https://github.com/bazelbuild/buildtools'
conflicts=('buildifier')
source=(
  "LICENSE-${pkgver}::https://raw.githubusercontent.com/bazelbuild/buildtools/v${pkgver}/LICENSE"
)
source_x86_64+=(
  "${pkgname}-x86_64-${pkgver}::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-amd64"
)
source_aarch64+=(
  "${pkgname}-aarch64-${pkgver}::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-arm64"
)
sha256sums=('cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')
sha256sums_x86_64=('887377fc64d23a850f4d18a077b5db05b19913f4b99b270d193f3c7334b5a9a7')
sha256sums_aarch64=('947bf6700d708026b2057b09bea09abbc3cafc15d9ecea35bb3885c4b09ccd04')

package() {
  cd "${srcdir}" || exit

  # Install the license file
  install -D -m 0644 \
    "${source[0]%%::*}" \
    "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"

  # Install the binary
  install -D -m 0755 \
    "./${pkgname}-${CARCH}-${pkgver}" \
    "${pkgdir}/usr/bin/${pkgname%-bin}"
}
