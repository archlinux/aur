pkgname=nsight-systems
pkgver=2024.7.1
_pkgver=2024.7.1.84-3512561
_pkgver_major=2024_7
pkgrel=1
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
  "https://developer.nvidia.com/downloads/assets/tools/secure/nsight-systems/${_pkgver_major}/NsightSystems-linux-public-${_pkgver}.run"
  "${pkgname}.png::https://developer.download.nvidia.com/images/nvidia-nsight-systems-icon-gbp-shaded-256.png"
  "${pkgname}.desktop"
)
sha256sums=(
  '2872acf7b4d725346c3faaf94c93fc9bd03938045111672a8ba083e86175a9be'
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
