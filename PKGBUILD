# Maintainer: duanluan <duanluan@outlook.com>

pkgname=emeditor-wine
pkgver=26.1.1
pkgrel=6
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
_commit='3b24fedf63951c3aa8557b0212e6f9c08cc0fc8a'
_upstream="emeditor-linux-${_commit}"
_msi="emed64_${pkgver}.msi"
source=(
  "${_upstream}.tar.gz::https://github.com/duanluan/emeditor-linux/archive/${_commit}.tar.gz"
  "${_msi}::https://download.emeditor.com/${_msi}"
)
sha256sums=(
  '271b05fbfae55372d7a4df1ac2a966c6bc19d38c99cc14fdf4e8f2bad1f84621'
  'bc54ae3700a657c159f176b8f5ad646a4cfef3090d8097ff8dfa99067340f5b5'
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
