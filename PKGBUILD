# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor: Yvaniak <ewen at philippot dot biz>
# Contributor: Benjamin Denhartog <ben@sudoforge.com>

pkgname=buildifier-bin
pkgver=8.2.0
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
sha256sums_x86_64=('3e79e6c0401b5f36f8df4dfc686127255d25c7eddc9599b8779b97b7ef4cdda7')
sha256sums_aarch64=('c624a833bfa64d3a457ef0235eef0dbda03694768aab33f717a7ffd3f803d272')

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
