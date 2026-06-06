# Maintainer: duanluan <duanluan@outlook.com>

pkgname=emeditor-wine
pkgver=26.1.1
pkgrel=4
pkgdesc='EmEditor text editor running through Wine'
arch=('x86_64')
url='https://www.emeditor.com/'
license=('custom:proprietary')
depends=(
  'bash'
  'hicolor-icon-theme'
  'noto-fonts-cjk'
  'wine'
  'xorg-xrandr'
  'xorg-xrdb'
)
makedepends=(
  '7zip'
)
optdepends=(
  'winetricks: optional Wine prefix tuning'
)
options=('!strip')
_msi="emed64_${pkgver}.msi"
source=(
  "${_msi}::https://download.emeditor.com/${_msi}"
  'emeditor-wine.sh'
  'emeditor-wine.desktop'
)
sha256sums=(
  'bc54ae3700a657c159f176b8f5ad646a4cfef3090d8097ff8dfa99067340f5b5'
  '6546f24bc30e536f17910c4e499c94f3e55da38d4da1e3487302ee024d882c99'
  '4e3bccc10159e521cd57b079a064fad852230e6dafe9484c522d5f223cd80c4c'
)

package() {
  7z e -y "${srcdir}/${_msi}" 'Binary.emeditor.targetsize256.png' \
    -o"${srcdir}" >/dev/null

  install -Dm644 "${srcdir}/${_msi}" \
    "${pkgdir}/usr/share/${pkgname}/${_msi}"
  install -Dm644 "${srcdir}/Binary.emeditor.targetsize256.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
  install -Dm755 "${srcdir}/emeditor-wine.sh" \
    "${pkgdir}/usr/bin/emeditor-wine"
  install -Dm644 "${srcdir}/emeditor-wine.desktop" \
    "${pkgdir}/usr/share/applications/emeditor-wine.desktop"
}
