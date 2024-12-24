# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor: Benjamin Denhartog <ben@sudoforge.com>

pkgname=buildozer-bin
pkgver=7.3.1
pkgrel=1
pkgdesc='A command line tool to rewrite Bazel BUILD files using standard conventions'
arch=('x86_64')
license=('Apache')
url='https://github.com/bazelbuild/buildtools'
source=(
  "${pkgname%-bin}-${pkgver}::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-amd64"
  "LICENSE-${pkgver}::https://raw.githubusercontent.com/bazelbuild/buildtools/v${pkgver}/LICENSE"
)
sha256sums=('3305e287b3fcc68b9a35fd8515ee617452cd4e018f9e6886b6c7cdbcba8710d4'
            'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')

package() {
  cd "${srcdir}" || exit

  # Install the license file
  install -D -m 0644 \
    "${source[1]%%::*}" \
    "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"

  # Install the binary
  install -D -m 0755 \
    "./${source[0]%%::*}" \
    "${pkgdir}/usr/bin/${pkgname%-bin}"
}
