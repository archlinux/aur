pkgname=axonhub-bin
_realver="1.0.0-rc.4"
pkgver="1.0.0_rc.4"
pkgrel=1
pkgdesc='Open-source AI Gateway — Use any SDK to call 100+ LLMs. Built-in failover, load balancing, cost control and end-to-end tracing.'
arch=('x86_64' 'aarch64')
url='https://github.com/looplj/axonhub'
license=('Apache-2.0' 'LGPL-3.0')
makedepends=('libarchive')
provides=('axonhub')
conflicts=('axonhub')
options=('!strip')

_triple_x86_64="linux_amd64"
_triple_aarch64="linux_arm64"

source_x86_64=("axonhub-${_realver}-linux_amd64.zip::https://github.com/looplj/axonhub/releases/download/v${_realver}/axonhub_${_realver}_linux_amd64.zip")
source_aarch64=("axonhub-${_realver}-linux_arm64.zip::https://github.com/looplj/axonhub/releases/download/v${_realver}/axonhub_${_realver}_linux_arm64.zip")

sha256sums_x86_64=('a60006e0dab315720875d3ebf39138dee63bbdaa64e44e040135e7c9df97cf5c')
sha256sums_aarch64=('a14e1d5f5365749ac1c7f18fddde70bd6119a26ac7dc3f3d5dc2a57295131379')

package() {
  local _triple
  case "${CARCH}" in
    x86_64)  _triple="${_triple_x86_64}" ;;
    aarch64) _triple="${_triple_aarch64}" ;;
    *) echo "ERROR: unsupported arch ${CARCH}" >&2; exit 1 ;;
  esac

  cd "${srcdir}"
  bsdtar -xf "axonhub-${_realver}-${_triple}.zip"
  install -Dm755 axonhub "${pkgdir}/usr/bin/axonhub"

  local f
  for f in LICENSE LICENSE.md COPYING README.md; do
    [[ -f "$f" ]] && install -Dm644 "$f" "${pkgdir}/usr/share/doc/${pkgname}/$f"
  done
}
