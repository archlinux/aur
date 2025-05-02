# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor: Benjamin Denhartog <ben@sudoforge.com>

pkgname=buildozer-bin
pkgver=8.2.0
pkgrel=1
pkgdesc='A command line tool to rewrite Bazel BUILD files using standard conventions'
arch=('x86_64' 'aarch64')
license=('Apache')
url='https://github.com/bazelbuild/buildtools'
conflicts=('buildozer')
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
sha256sums_x86_64=('0e54770aa6148384d1edde39ef20e10d2c57e8c09dd42f525e100f51b0b77ae1')
sha256sums_aarch64=('a9f38f2781de41526ce934866cb79b8b5b59871c96853dc5a1aee26f4c5976bb')

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
