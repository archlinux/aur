pkgname=openbitdo-bin
pkgver=0.0.1rc4
_upstream_tag=v0.0.1-rc.4
pkgrel=1
pkgdesc="Prebuilt beginner-first clean-room 8BitDo utility"
arch=('x86_64' 'aarch64')
url="https://github.com/bybrooklyn/openbitdo"
license=('BSD-3-Clause')
depends=('hidapi')
source_x86_64=("openbitdo-${_upstream_tag}-linux-x86_64.tar.gz::${url}/releases/download/${_upstream_tag}/openbitdo-${_upstream_tag}-linux-x86_64.tar.gz")
source_aarch64=("openbitdo-${_upstream_tag}-linux-aarch64.tar.gz::${url}/releases/download/${_upstream_tag}/openbitdo-${_upstream_tag}-linux-aarch64.tar.gz")
sha256sums_x86_64=('3f654f2dc301d9a917f0b5eff95a4e09285a8898d4e56f6070a3dc618e5ec905')
sha256sums_aarch64=('dded281452b1be2f33ffd9364b819217b4e3e14e20e6c85879f5931e40716b3c')

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
