# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:

pkgname=ibazel-bin
pkgver=0.33.0
pkgrel=2
pkgdesc='Tool for building Bazel targets when source files change.'
arch=('x86_64' 'aarch64')
license=('Apache-2.0')
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
sha256sums_x86_64=('55b3a88185f4c424305eaece9a60192dde10e0fe8d2cab22eaabeee9e5b8caac')
sha256sums_aarch64=('f52dbac8f2d32adc7aff9494042fdf5d0c54e5da22b37a9495325686c8dbdb69')

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
