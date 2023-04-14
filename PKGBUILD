# Maintainer: Nick <nift4@protonmail.com>
# Maintainer: Erfan Abdi <erfangplus@gmail.com>
# Contributor: ikeramat <ikeramat@protonmail.com>
pkgname=lmo-desktop-mode-git
_pkgname=lmo-desktop-mode
pkgver=1.0.1
pkgrel=7
pkgdesc="Client and companion application for LibreMobileOS desktop mode"
arch=('x86_64')
license=('GPL-2.0-only')
url='https://get.libremobileos.com/desktop'
depends=('jdk-openjdk' 'jre-openjdk' 'android-tools' 'android-udev')
makedepends=('make' 'cmake' 'unzip')
source=(${_pkgname}.desktop
        "https://git.libremobileos.com/LMODroid/platform_external_tigervnc/-/archive/desktop-mode_v${pkgver}/platform_external_tigervnc-desktop-mode_v${pkgver}.zip")
sha256sums=('d70cb80cf2b4c04953cff452f8d4e398e6f3c624f14d71697a001fefe10532d1'
            '9af3c919422d5e59d555479766d3cbd7b453e007708924f1b87062f77a042fb3')
prepare() {
  unzip platform_external_tigervnc-desktop-mode_v${pkgver}.zip
  cd platform_external_tigervnc-desktop-mode_v${pkgver}/java
  cmake .
}
build() {
  cd platform_external_tigervnc-desktop-mode_v${pkgver}/java
  make
}
package() {
  install -d "${pkgdir}/usr/share/${_pkgname}"
  install -d "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/share/icons"
  install -m644 "platform_external_tigervnc-desktop-mode_v${pkgver}/java/VncViewer.jar" "${pkgdir}/usr/share/${_pkgname}"
  install -m644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -m644 "platform_external_tigervnc-desktop-mode_v${pkgver}/java/com/tigervnc/vncviewer/tigervnc.png" "${pkgdir}/usr/share/icons/${_pkgname}.png"

}

