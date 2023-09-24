# Maintainer: Martin Stibor <martin.von.reichenberg@proton.me>
# Contributor: BrLi <hidden>
# Contributor: philacs <yue.liu@mail.com>

pkgname=xperia-flashtool
_pkgname=Flashtool
pkgver=0.9.36.0
pkgrel=2
pkgdesc="A S1 protocol flashing software for Sony Xperia phones"
arch=('x86_64')
url="http://www.flashtool.net/"
license=('GPL3')
depends=('libselinux' 'libsystemd' 'glib2' 'mono' 'jre-openjdk' 'java-environment-common')
makedepends=('base-devel')
# ${source} obtained from upstream project ${url}
source=("https://github.com/Androxyde/Flashtool/releases/download/${pkgver}/${_pkgname}-${pkgver}.tar.bz2"
        "${pkgname}.desktop"
        "${pkgname}.png")
# Upstream archive and launcher script
md5sums=('SKIP'
         'SKIP'
         'SKIP')
options=('!strip')

build() {
  tar -xf ${_pkgname}-${pkgver}.tar.bz2
}

package() {
  # Install program files
  install -m 644 -d "${pkgdir}"/opt/"${pkgname}"
  cp -a "${_pkgname}"/. "${pkgdir}"/opt/"${pkgname}"
  chmod 755 "${pkgdir}"/opt/"${pkgname}"
  install -m 755 -d "${pkgdir}"/usr/bin/
  ln -s "${pkgdir}"/opt/"${pkgname}"/FlashTool "${pkgdir}"/usr/bin/"${pkgname}"
  install -Dm644 "${pkgname}".png "${pkgdir}"/usr/share/icons/xperia-flashtool.png
  install -Dm644 "${pkgname}".desktop "${pkgdir}"/usr/share/applications/xperia-flashtool.desktop
  install -Dm644 "${_pkgname}"/x10flasher_native/udev/libusbx-1.0.so.0.2.0 "${pkgdir}"/usr/lib/xperia-flashtool/x10flasher_native/udev/libusbx-1.0.so.0.2.0
}
