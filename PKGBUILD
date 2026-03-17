# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:

pkgname=ibazel-bin
pkgver=0.28.1
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
sha256sums_x86_64=('5e55e1358b28f30248b4468ad34c4ae078cdbdd7c141a15757c44384409b0a18')
sha256sums_aarch64=('8442657041a3b3a6a436584ed6edc1f8ae11ae4bb67436c7805eaa206fcf56d1')

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
