# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:

pkgname=ibazel-bin
pkgver=0.30.0
pkgrel=1
pkgdesc='Tool for building Bazel targets when source files change.'
arch=('x86_64' 'aarch64')
license=('Apache')
url='https://github.com/bazelbuild/bazel-watcher'
conflicts=('ibazel' 'ibazel-git')
source=(
  "LICENSE-${pkgver}::https://raw.githubusercontent.com/bazelbuild/bazel-watcher/v${pkgver}/LICENSE"
)
source_x86_64+=(
  "${pkgname}-x86_64-${pkgver}::${url}/releases/download/v${pkgver}/${pkgname%-bin}_linux_amd64"
)
source_aarch64+=(
  "${pkgname}-aarch64-${pkgver}::${url}/releases/download/v${pkgver}/${pkgname%-bin}_linux_arm64"
)
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('6b0ef4763b8c1a7c0c5c8f3b2b01d32fbbc51e5014af8c75951aa0161d4b0b9e')
sha256sums_aarch64=('8d3dd668171fc68b3c76b1347a11c9f98b99f377fa8941af8155f616cc137f57')

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
