pkgname=openbitdo-bin
pkgver=0.0.1rc1
_upstream_tag=v0.0.1-rc.1
pkgrel=1
pkgdesc="Prebuilt beginner-first clean-room 8BitDo utility"
arch=('x86_64' 'aarch64')
url="https://github.com/bybrooklyn/openbitdo"
license=('BSD-3-Clause')
depends=('hidapi')
source_x86_64=("openbitdo-${_upstream_tag}-linux-x86_64.tar.gz::${url}/releases/download/${_upstream_tag}/openbitdo-${_upstream_tag}-linux-x86_64.tar.gz")
source_aarch64=("openbitdo-${_upstream_tag}-linux-aarch64.tar.gz::${url}/releases/download/${_upstream_tag}/openbitdo-${_upstream_tag}-linux-aarch64.tar.gz")
sha256sums_x86_64=('e5a8c2c5b241ea743d12fb173a2c9cd5dcbf5857e9ee870842a698a041b22ce7')
sha256sums_aarch64=('7bfd151d5c91be2011541b707efce48db01901d63800318da0ea46ac6a4d4673')

package() {
  local extracted_dir
  extracted_dir="$(find "${srcdir}" -maxdepth 1 -type d -name "openbitdo-${_upstream_tag}-linux-${CARCH}" | head -n 1)"
  if [[ -z "${extracted_dir}" ]]; then
    echo "unable to locate extracted release payload for ${CARCH}" >&2
    return 1
  fi

  install -Dm755 "${extracted_dir}/bin/openbitdo" "${pkgdir}/usr/bin/openbitdo"
  install -Dm644 "${extracted_dir}/README.md" "${pkgdir}/usr/share/doc/openbitdo/README.md"
  install -Dm644 "${extracted_dir}/LICENSE" "${pkgdir}/usr/share/licenses/openbitdo/LICENSE"
}
