# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor: Benjamin Denhartog <ben@sudoforge.com>

pkgname=buildozer-bin
pkgver=8.0.0
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
sha256sums_x86_64=('d0a7adf739fa389e0dc87eae5d11ed0a864260308b4887e5fd30a17d9c33ca9b')
sha256sums_aarch64=('410d0b1d46a3e044a5d5edb02f24152fd99d58cbddf26fcf802481e0e98bbc2e')

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
