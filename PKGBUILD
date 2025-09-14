# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="Source2Viewer-CLI"
_pkgname="${_Name,,}"
pkgname="${_pkgname}-bin"
pkgver=14.1
pkgrel=2
pkgdesc="Browse VPK archives, view, extract, and decompile Source 2 assets, including maps, models, materials, textures, sounds"
arch=('aarch64' 'armv7h' 'x86_64')
url="https://s2v.app"
_url="https://github.com/ValveResourceFormat/ValveResourceFormat"
license=('MIT')
depends=(
  'gcc-libs'
  'glibc'
)
provides=(
  "${_pkgname}"
  'vrf-decompiler'
  'vrf-decompiler-bin'
)
conflicts=(
  "${_pkgname}"
  'vrf-decompiler'
)
replaces=(
  'vrf-decompiler-bin'
)
options=('!strip' '!debug')
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-README.md::${_url}/raw/refs/tags/${pkgver}/README.md"
        "${_pkgsrc}-LICENSE::${_url}/raw/refs/tags/${pkgver}/LICENSE")
source_aarch64=("${_pkgsrc}-aarch64.zip::${_url}/releases/download/${pkgver}/cli-linux-arm64.zip")
source_armv7h=("${_pkgsrc}-armv7h.zip::${_url}/releases/download/${pkgver}/cli-linux-arm.zip")
source_x86_64=("${_pkgsrc}-x86_64.zip::${_url}/releases/download/${pkgver}/cli-linux-x64.zip")
noextract=("${source_aarch64[@]%%::*}"
           "${source_armv7h[@]%%::*}"
           "${source_x86_64[@]%%::*}")
sha256sums=('6b8628ee22b46d7db400cabe7dd17057e9e941f74712a808f98564b923db1941'
            '19549e9b3203eaf3938f35f98e63fc6b166a16af29936affa3df6ec7e2ae7f8d')
sha256sums_aarch64=('9e37b08e1d3606fe95cf4d20d4ae01afa715c7cde336a45107daa1f97b9905b6')
sha256sums_armv7h=('d751f6bd0c96fb51d6b3c976145f2d6e7b126912ffd3b0da44ff4cc8e5321429')
sha256sums_x86_64=('6edd8bef26e437d930aed00f6f4ad115e666573754594fe4652067bac614a8b7')

package() {
  cd "${srcdir}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  install -vd "${pkgdir}/usr/bin" "${pkgdir}/usr/lib/${_pkgname}"
  bsdtar --no-same-owner -xvf "${_pkgsrc}-${CARCH}.zip" -C "${pkgdir}/usr/lib/${_pkgname}"
  ln -vsf "/usr/lib/${_pkgname}/${_Name}" "${pkgdir}/usr/bin/${_Name}"
}
