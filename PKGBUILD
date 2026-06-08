# Maintainer: duanluan <duanluan@outlook.com>

pkgname=emeditor-wine
pkgver=26.1.1
pkgrel=5
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
_commit='d57f159bc4fcf6962795743854e6ba98f543e3e0'
_upstream="emeditor-linux-${_commit}"
_msi="emed64_${pkgver}.msi"
source=(
  "${_upstream}.tar.gz::https://github.com/duanluan/emeditor-linux/archive/${_commit}.tar.gz"
  "${_msi}::https://download.emeditor.com/${_msi}"
)
sha256sums=('c4fe4ef95bacf2cdb84767ffc95cea66879f5286da8d4786024e3116213514d8'
            'bc54ae3700a657c159f176b8f5ad646a4cfef3090d8097ff8dfa99067340f5b5')

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
