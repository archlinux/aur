# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="SatisfactoryModManager"
_pkgname="satisfactory-mod-manager"
pkgname="${_pkgname}-bin"
pkgver=3.0.5
pkgrel=2
pkgdesc="A mod manager for easy installation of mods and modloader for Satisfactory"
arch=(
  'x86_64'
)
url="https://github.com/satisfactorymodding/${_Name}"
license=(
  'GPL-3.0-only'
)
depends=(
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libsoup3'
  'webkit2gtk-4.1'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${_pkgname}-${pkgver}"
source=(
  "${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
  "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE"
  "${_pkgsrc}.desktop::${url}/raw/refs/tags/v${pkgver}/build/linux/${_Name}.desktop"
  "${_pkgsrc}.ico::${url}/raw/refs/tags/v${pkgver}/icons/icon.ico"
)
source_x86_64=(
  "${_pkgsrc}-x86_64::${url}/releases/download/v${pkgver}/${_Name}_linux_amd64"
)
sha256sums=('1bae57c3f1dcaf4d36e35e28d613893ff10541437e9fed0ec715dd13eac58add'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '2a665efd6d635ef0925bc52c7e794f065c2875c8ca20c552505b0740666ca024'
            '2d71e119fa6c6e64d77c3c251765ec5c2279c76f0c8ada48bb5e9e5c50624403'
            'ffb633001d1ddd21f427d4f183ee7376bc0ec78daee025c565f91c3bffb7aeee'
            '31f009e7892849345ca40e9806e4504ec6c3156ade19a5a5e658aefa4a5dffae'
            'eb1b5a81044d73bcf4cb0245dc6e57381756c261f19328b1ef3d5ed1ea01bfa8'
            '23cc56f60c02bee1ddebd9f02290bdb18ae52f1a2b9827fdc1d220ef6023c70a'
            '0694a6dccd4407c5fee4aa3afa7d1cfc2f658afe204e642f6abd84c4f716bf77'
            '549a0ecef95c7468296df7e55b968c00851b3a51b46d063f76f9eb2aeda40d59')
sha256sums_x86_64=('04b1023adbc53807e9d1f4757343f6f4fbebc2445c47a863c358ea46cc8c1f51')

declare -rg _sizes="16 32 64 128 256 512"
for _size in $_sizes; do
  source+=(
    "${_pkgsrc}.${_size}x${_size}.png::${url}/raw/refs/tags/v${pkgver}/icons/${_size}x${_size}.png"
  )
done

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}"  "${pkgdir}/usr/bin/${_Name}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -vDm644 "${_pkgsrc}.desktop"   "${pkgdir}/usr/share/applications/${_Name}.desktop"
  install -vDm644 "${_pkgsrc}.ico"       "${pkgdir}/usr/share/pixmaps/${_Name}.ico"

  for _size in $_sizes; do
    install -vDm644 "${_pkgsrc}.${_size}x${_size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/${_Name}.png"
  done
}
