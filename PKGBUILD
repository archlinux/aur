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
pkgrel=3
pkgdesc="Flashtool is a S1 protocol flashing software that can be used to flash firmwares for Sony Xperia smartphones"
arch=('any')
url="http://www.flashtool.net/"
license=('GPL3')
depends=('systemd' 'systemd-libs' 'bash' 'glib2' 'glibc' 'alsa-lib' 'mono' 'jre-openjdk' 'java-environment-common'
         'libx11' 'gcc-libs' 'libxrender' 'freetype2' 'libxext' 'libxtst' 'libxi' 'zlib' 'lib32-gcc-libs' 'lib32-glibc')
makedepends=('base-devel')
source=("https://github.com/Androxyde/Flashtool/releases/download/${pkgver}/${_pkgname}-${pkgver}.tar.bz2"
        "$pkgname.desktop" "$pkgname.png")
# Upstream archive and launcher script
md5sums=('SKIP' 'SKIP' 'SKIP')
options=('!strip')

build() {
  tar -xf "${_pkgname}"-"${pkgver}".tar.bz2
}

package() {
  # Install program files
  install -m 644 -d "${pkgdir}"/opt/"${pkgname}"
  cp -a "${_pkgname}"/. "${pkgdir}"/opt/"${pkgname}"
  chmod 755 "${pkgdir}"/opt/"${pkgname}"
  install -m 755 -d "${pkgdir}"/usr/bin/
  ln -s /opt/"${pkgname}"/FlashTool "${pkgdir}"/usr/bin/"${pkgname}"
  install -Dm644 "${pkgname}".png "${pkgdir}"/usr/share/icons/xperia-flashtool.png
  install -Dm644 "${pkgname}".desktop "${pkgdir}"/usr/share/applications/xperia-flashtool.desktop
  install -Dm644 "${_pkgname}"/x10flasher_native/udev/libusbx-1.0.so.0.2.0 "${pkgdir}"/usr/lib/xperia-flashtool/x10flasher_native/udev/libusbx-1.0.so.0.2.0
}
