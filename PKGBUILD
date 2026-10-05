# Maintainer: duanluan <duanluan@outlook.com>

pkgname=emeditor-wine
pkgver=26.2.9
pkgrel=1
pkgdesc='EmEditor text editor running through Wine'
arch=('x86_64')
url='https://github.com/duanluan/emeditor-linux'
license=('MIT' 'custom:proprietary')
depends=(
  'bash'
  'curl'
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
_commit='e488462dfcf21408714151fba6e868a30b9a00ce'
_upstream="emeditor-linux-${_commit}"
_msi="emed64_${pkgver}.msi"
source=(
  "${_upstream}.tar.gz::https://github.com/duanluan/emeditor-linux/archive/${_commit}.tar.gz"
  "${_msi}::https://download.emeditor.com/${_msi}"
)
sha256sums=(
  'fc17a88f057f4d47980b7ad4f357393af3fc5be8e06e67c5f4011c6c2acaff3d'
  '362614c0d3ed934f3bafdc43e8b1f45337bc9744d60fd2ff79e72dc90d0cb856'
)

package() {
  local upstream_dir="${srcdir}/${_upstream}"

  7z e -y "${srcdir}/${_msi}" 'Binary.emeditor.targetsize256.png' \
    -o"${srcdir}" >/dev/null

  install -Dm755 "${upstream_dir}/scripts/emeditor-wine" \
    "${pkgdir}/usr/bin/emeditor-wine"
  install -Dm644 "${upstream_dir}/assets/emeditor-wine.desktop" \
    "${pkgdir}/usr/share/applications/emeditor-wine.desktop"
  install -Dm644 "${srcdir}/${_msi}" \
    "${pkgdir}/usr/share/${pkgname}/${_msi}"
  install -Dm644 "${srcdir}/Binary.emeditor.targetsize256.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/emeditor-wine.png"
  install -Dm644 "${upstream_dir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${upstream_dir}/README.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
