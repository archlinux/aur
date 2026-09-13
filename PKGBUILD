# Maintainer: duanluan <duanluan@outlook.com>

pkgname=emeditor-wine
pkgver=26.2.7
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
_commit='e6e5e6224939c1d98d8199398dd4eaa029239cf4'
_upstream="emeditor-linux-${_commit}"
_msi="emed64_${pkgver}.msi"
source=(
  "${_upstream}.tar.gz::https://github.com/duanluan/emeditor-linux/archive/${_commit}.tar.gz"
  "${_msi}::https://download.emeditor.com/${_msi}"
)
sha256sums=(
  '00d09924fbdbec122ec48e51f9ef49b5bce76c53fe258c21d233a4fd443d1265'
  '8999dc0c78a199f15c1b1e6b49b5b5322dc43a36df5b60b09b8f5ce86c4a8f74'
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
