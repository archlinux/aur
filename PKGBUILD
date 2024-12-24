# Maintainer: Yvaniak <ewen at philippot dot biz>
# Maintainer: Benjamin Denhartog <ben@sudoforge.com>

# For ISSUES, REQUESTS, and QUESTIONS:
# feel free to let on the aur package page


pkgname=buildifier-bin
pkgver=7.1.1
pkgrel=2
pkgdesc='A command line tool to format Bazel BUILD files'
arch=('x86_64')
license=('Apache')
url='https://github.com/bazelbuild/buildtools'
source=(
  "${pkgname%-bin}-${pkgver}::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-amd64"
  "LICENSE-${pkgver}::https://raw.githubusercontent.com/bazelbuild/buildtools/v${pkgver}/LICENSE"
)
sha256sums=('54b7f2ce8f22761cfad264416e912056ae9c8645f59eb6583b846b4864a1ee83'
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
