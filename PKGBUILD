pkgname=nsight-systems
pkgver=2024.5.1
_pkgver=2024.5.1.113-3461954
pkgrel=2
pkgdesc="A system-wide performance analysis tool for CPUs and GPUs"
arch=('x86_64')
url="https://developer.nvidia.com/nsight-systems"
depends=(
  'libxcb'
  'dbus'
  'expat'
  'fontconfig'
  'freetype2'
  'libglvnd'
  'libice'
  'libsm'
  'libssh'
  'libx11'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxkbcommon-x11'
  'libxkbfile'
  'libxrandr'
  'libxrender'
  'libxshmfence'
  'libxtst'
  'nspr'
  'nss'
  'xcb-util-image'
  'xcb-util-keysyms'
  'xcb-util-renderutil'
  'xcb-util-wm')
license=('LicenseRef-NvidiaProprietary')
source=(
  "https://developer.nvidia.com/downloads/assets/tools/secure/nsight-systems/2024_5/NsightSystems-linux-public-${_pkgver}.run"
  "${pkgname}.png::https://developer.download.nvidia.com/images/nvidia-nsight-systems-icon-gbp-shaded-256.png"
  "${pkgname}.desktop"
)
sha256sums=(
  'ff24e8fde1f73a46270114c4247d1e55c72d9fd351f35bb46a8b95af2e6f74ce'
  '38cd754a193f1715095837f97bee3a274831142dc19169240ed23d527dd4c815'
  'ba75a6ec16a49c5a8484b4e48eb676d16da3c7c7e8382c98d761f8fdc4460007'
)

prepare() {
  sh ./NsightSystems-linux-public-${_pkgver}.run --noexec --target "${pkgname}"
}

package() {
  cd ${srcdir}/${pkgname}
  ./install-linux.pl -noprompt -targetpath="${pkgdir}/opt/${pkgname}"

  install -dm 755 "${pkgdir}/usr/bin"
  ln -s /opt/${pkgname}/bin/nsys "${pkgdir}/usr/bin"
  ln -s /opt/${pkgname}/bin/nsys-ui "${pkgdir}/usr/bin"

  install -Dm644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 "${srcdir}/${pkgname}/pkg/EULA.txt"
}
