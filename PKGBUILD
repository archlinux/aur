# Author:       Androxyde <NONE>
# Contributor:  Bin4ry <NONE>
# Contributor:  DooMLoRD <NONE>
# Contributor:  [NUT] <NONE>
# Contributor:  DevShaft <NONE>
# Contributor:  laguCool <NONE>
# Maintainer:   Martin Stibor <martin.von.reichenberg@proton.me>

pkgname=xperia-flashtool-bin
_pkgname=xperia-flashtool
__pkgname=Flashtool
pkgver=0.9.36.0
pkgrel=2
pkgdesc="Flashtool is a S1 protocol flashing software that can be used to flash firmwares for Sony Xperia smartphones"
arch=('any')
url="http://www.flashtool.net/"
license=('GPL3')
depends=('systemd-libs' 'bash' 'glib2' 'glibc' 'alsa-lib' 'mono' 'java-runtime-common' 'java-environment-common'
                  'libx11' 'gcc-libs' 'libxrender' 'freetype2' 'libxext' 'libxtst' 'libxi' 'zlib')
makedepends=('tar' 'fdupes' 'desktop-file-utils')
provides=("xperia-flashtool=${pkgver}" 'libusbx-1.0.so.0.2.0')
conflicts=("xperia-flashtool")
source=("${__pkgname}-${pkgver}.tar.bz2::https://github.com/Androxyde/Flashtool/releases/download/${pkgver}/${__pkgname}-${pkgver}.tar.bz2"
        "${_pkgname}" "${_pkgname}.desktop" "${_pkgname}.png")
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')
options=('!strip')

package() {
  mkdir -p "${pkgdir}/opt/"
  tar -xf "${srcdir}/${__pkgname}-${pkgver}.tar.bz2" -C "${pkgdir}/opt/"

  mv -f "${pkgdir}/opt/${__pkgname}/" "${pkgdir}/opt/${_pkgname}/"
  chmod -f -R 0755 "${pkgdir}/opt/${_pkgname}/"

  install -Dm755 "${srcdir}/${_pkgname}" -t "${pkgdir}/usr/bin/"
  install -Dm644 "${srcdir}/${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications/"
  install -Dm644 "${srcdir}/${_pkgname}.png" -t "${pkgdir}/usr/share/icons/"

  mkdir -p "${pkgdir}/usr/lib/"
  ln -n "${pkgdir}/opt/${_pkgname}/x10flasher_native/udev/libusbx-1.0.so.0.2.0" -t "${pkgdir}/usr/lib/"

  fdupes -r -s "${pkgdir}/"
  desktop-file-validate "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
