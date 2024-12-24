# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor: Yvaniak <ewen at philippot dot biz>
# Contributor: Benjamin Denhartog <ben@sudoforge.com>

pkgname=buildifier-bin
pkgver=7.3.1
pkgrel=1
pkgdesc='A command line tool to format Bazel BUILD files'
arch=('x86_64')
license=('Apache')
url='https://github.com/bazelbuild/buildtools'
source=(
  "${pkgname%-bin}-${pkgver}::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-amd64"
  "LICENSE-${pkgver}::https://raw.githubusercontent.com/bazelbuild/buildtools/v${pkgver}/LICENSE"
)
sha256sums=('5474cc5128a74e806783d54081f581662c4be8ae65022f557e9281ed5dc88009'
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
