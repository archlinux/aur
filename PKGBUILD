# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:

pkgname=ibazel-bin
pkgver=0.26.8
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
sha256sums_x86_64=('e621a3bf5d3a0f3cccfd8a6fbd72707398ba37e39897dc8762f3eebf5b08fd9d')
sha256sums_aarch64=('f7fd7ebd8a604614f2e1a3b2476fe9c055ea88d165da86d3f303d7d6903fb332')

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
