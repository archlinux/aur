# Maintainer: Benjamin Denhartog <ben@sudoforge.com>

# For ISSUES, REQUESTS, and QUESTIONS:
# https://github.com/sudoforge/pkgbuilds

pkgname=buildozer-bin
pkgver=4.2.2
pkgrel=2
pkgdesc='A command line tool to rewrite Bazel BUILD files using standard conventions'
arch=('x86_64')
license=('Apache')
url='https://github.com/bazelbuild/buildtools'
source=(
  "${pkgname%-bin}-${pkgver}::${url}/releases/download/${pkgver}/${pkgname%-bin}-linux-amd64"
  "LICENSE-${pkgver}::https://raw.githubusercontent.com/bazelbuild/buildtools/${pkgver}/LICENSE"
)
sha256sums=('83c7c668eed674e32f2aedd789b114cd49830c063f6e1a4b60a08012b384a88f'
            'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')

package() {
  cd "${srcdir}"

  # Install the license file
  install -D -m 0644 \
    "${source[1]%%::*}" \
    "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"

  # Install the binary
  install -D -m 0755 \
    "./${source[0]%%::*}" \
    "${pkgdir}/usr/bin/${pkgname%-bin}"
}
