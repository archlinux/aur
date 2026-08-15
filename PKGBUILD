# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="vapoursynth-plugin-zsmooth"
pkgname="${_pkgname}-bin"
pkgver=0.20.0
pkgrel=1
pkgdesc="Zsmooth plugin for VapourSynth"
arch=(
  'aarch64'
  'x86_64'
)
url="https://github.com/adworacz/zsmooth"
license=(
  'MIT'
)
depends=(
  'glibc'
  'vapoursynth'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${_pkgname}-${pkgver}"
source=(
  "${_pkgsrc}-README.md::${url}/raw/refs/tags/${pkgver}/README.md"
  "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/${pkgver}/LICENSE"
)
source_aarch64=(
  "${pkgname}-${pkgver}-aarch64-linux-gnu.zip::${url}/releases/download/${pkgver}/zsmooth-aarch64-linux-gnu.zip"
)
source_x86_64=(
  "${pkgname}-${pkgver}-x86_64-linux-gnu.zip::${url}/releases/download/${pkgver}/zsmooth-x86_64-linux-gnu.zip"
)
sha256sums=('d6306977ccff39eabcc6c78875c092c689a37a85b78f77a4872dcdd4fe79064d'
            '4e8049adeaf266a580ff8738729a568465fded9a1bdf25396f234d2b8b07552f')
sha256sums_aarch64=('cc4c7a5f5d73b1f34c42a0e9e421c8f12df8b7d416211a8b19fde178a72e7103')
sha256sums_x86_64=('3b4895f9b7b135fc41880d12010a7e8a298657722ca83282da7cbb9db663bc30')

package() {
  local vapoursynth_plugin_dir="$(python -c "import vapoursynth; print(vapoursynth.get_plugin_dir())")"

  cd "${srcdir}"
  install -vDm755 "lib${_pkgname##*-}.so" -t "${pkgdir}${vapoursynth_plugin_dir}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
