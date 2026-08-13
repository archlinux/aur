# Maintainer: rendogust <rendogust@gmail.com>
# https://github.com/yookibooki/aur-packages/issues
# Telegram: @javohir81

pkgname=axonhub-bin
_realver=1.0.0-beta7
pkgver=1.0.0_beta7
pkgrel=1
pkgdesc='Open-source AI Gateway — Use any SDK to call 100+ LLMs. Built-in failover, load balancing, cost control and end-to-end tracing.'
arch=('x86_64' 'aarch64')
url='https://github.com/looplj/axonhub'
license=('Apache-2.0' 'LGPL-3.0')
makedepends=('libarchive')
provides=('axonhub')
conflicts=('axonhub')

# GOOS_GOARCH triples per arch
# source_* and sha256sums_* auto-updated by publish.yml
_triple_x86_64="linux_amd64"
_triple_aarch64="linux_arm64"

source_x86_64=("axonhub-${_realver}-linux_amd64.zip::https://github.com/looplj/axonhub/releases/download/v${_realver}/axonhub_${_realver}_linux_amd64.zip")
source_aarch64=("axonhub-${_realver}-linux_arm64.zip::https://github.com/looplj/axonhub/releases/download/v${_realver}/axonhub_${_realver}_linux_arm64.zip")

sha256sums_x86_64=('963c24f2dc1cef88f2724e28e0a73b07d98c11daef93df72848db401e07755b3')
sha256sums_aarch64=('96df6b1a1c3ea0dfc2b75fbe73f49ebe277ae9315661e613c3a8df7983d073d6')

package() {
  local _triple
  case "${CARCH}" in
    x86_64)  _triple="${_triple_x86_64}" ;;
    aarch64) _triple="${_triple_aarch64}" ;;
  esac

  cd "${srcdir}"
  bsdtar -xf "axonhub-${_realver}-${_triple}.zip"
  install -Dm755 -s axonhub "${pkgdir}/usr/bin/axonhub"
}
