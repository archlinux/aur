pkgname=axonhub-bin
_realver="1.0.0-rc1"
pkgver="1.0.0_rc1"
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

sha256sums_x86_64=('c8a8310620576c1f4111966528ed43f772e3c1025f1501389417fb01fa89b855')
sha256sums_aarch64=('111995d79d9c7c4269f4ecc30262c7d2e690ccc10428b3e1e609b44a52fb9f23')

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
