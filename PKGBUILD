# Maintainer: rendogust <rendogust@gmail.com>

pkgname=axonhub-bin
pkgver=1.0.0-beta5
pkgrel=1
pkgdesc='Open-source AI Gateway — Use any SDK to call 100+ LLMs. Built-in failover, load balancing, cost control and end-to-end tracing.'
arch=('x86_64' 'aarch64')
url='https://github.com/looplj/axonhub'
license=('Apache-2.0' 'LGPL-3.0')
provides=('axonhub')
conflicts=('axonhub')

# GOOS_GOARCH triples per arch
# source_* and sha256sums_* auto-updated by publish.yml
_triple_x86_64="linux_amd64"
_triple_aarch64="linux_arm64"

source_x86_64=("axonhub-${pkgver}-linux_amd64.zip::https://github.com/looplj/axonhub/releases/download/v${pkgver}/axonhub_${pkgver}_linux_amd64.zip")
source_aarch64=("axonhub-${pkgver}-linux_arm64.zip::https://github.com/looplj/axonhub/releases/download/v${pkgver}/axonhub_${pkgver}_linux_arm64.zip")

sha256sums_x86_64=('fa8f764c559965d84c92908a2fc973effce5c569a56843e4771c8fc9c6496bfb')
sha256sums_aarch64=('789f1ed8500604c29faed9f2def06d1022b696da849d35644191a6d96d46c1c7')

package() {
  local _triple
  case "${CARCH}" in
    x86_64)  _triple="${_triple_x86_64}" ;;
    aarch64) _triple="${_triple_aarch64}" ;;
  esac

  cd "${srcdir}"
  bsdtar -xf "axonhub-${pkgver}-${_triple}.zip"
  cd axonhub_*/
  install -Dm755 axonhub "${pkgdir}/usr/bin/axonhub"
}
