# Author:       Androxyde <NONE>
# Contributor:  Bin4ry <NONE>
# Contributor:  DooMLoRD <NONE>
# Contributor:  [NUT] <NONE>
# Contributor:  DevShaft <NONE>
# Contributor:  laguCool <NONE>
# Maintainer:   Martin Stibor <martin.von.reichenberg@proton.me>

pkgname=xperia-flashtool
_pkgname=Flashtool
pkgver=0.9.36.0
pkgrel=4
pkgdesc="Flashtool is a S1 protocol flashing software that can be used to flash firmwares for Sony Xperia smartphones"
arch=('any')
url="http://www.flashtool.net/"
license=('GPL3')
depends=('systemd' 'systemd-libs' 'bash' 'glib2' 'glibc' 'alsa-lib' 'mono' 'jre-openjdk' 'java-environment-common'
         'libx11' 'gcc-libs' 'libxrender' 'freetype2' 'libxext' 'libxtst' 'libxi' 'zlib' 'lib32-gcc-libs' 'lib32-glibc')
makedepends=('base-devel')
source=("${_pkgname}-${pkgver}.tar.bz2::https://github.com/Androxyde/Flashtool/releases/download/${pkgver}/${_pkgname}-${pkgver}.tar.bz2"
        "${pkgname}" "${pkgname}.desktop" "${pkgname}.png")
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')
options=('!strip')

build() {
  tar -xf "${srcdir}/${_pkgname}-${pkgver}.tar.bz2"
}

package() {
  # Install program files
  install -dm644 "${pkgdir}/opt/${pkgname}"
  cp -a "${srcdir}/${_pkgname}/." -t "${pkgdir}/opt/${pkgname}"
  chmod 0755 "${pkgdir}/opt/${pkgname}/FlashTool"
  install -dm755 "${pkgdir}/usr/bin/"
  install -Dm755 "${srcdir}/${pkgname}" -t "${pkgdir}/usr/bin/"
  install -Dm644 "${srcdir}/${pkgname}.png" -t "${pkgdir}/usr/share/icons/"
  install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications/"
  install -Dm644 "${srcdir}/${_pkgname}/x10flasher_native/udev/libusbx-1.0.so.0.2.0" \
                 "${pkgdir}/usr/lib/${pkgname}/x10flasher_native/udev/libusbx-1.0.so.0.2.0"
}
