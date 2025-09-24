# Maintainer: Nick <nift4@protonmail.com>
# Maintainer: Erfan Abdi <erfangplus@gmail.com>
# Contributor: ikeramat <ikeramat@protonmail.com>
# Contributor: Dhina17 <dhinalogu@gmail.com>
pkgname=lmo-desktop-mode-git
_pkgname=lmo-desktop-mode
pkgver=1.0.1
pkgrel=10
pkgdesc="Client and companion application for LibreMobileOS desktop mode"
arch=('x86_64' 'aarch64')
license=('GPL-2.0-only')
url='https://get.libremobileos.com/desktop'
depends=('jdk-openjdk' 'android-tools' 'android-udev')
makedepends=('make' 'cmake' 'unzip')
source=(${_pkgname}.desktop
        "https://git.libremobileos.com/LMODroid/platform_external_tigervnc/-/archive/desktop-mode_v${pkgver}/platform_external_tigervnc-desktop-mode_v${pkgver}.zip")
sha256sums=('9fd27b6d41e7a8af5cffcadfa39912c85ff483f07ad969356fa2fe4008138cc3'
            'ffb1d0f85cbfe7d1048f487daa67431abbf3a212d607813c23a68e969bed1d8b')
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
  install -d "${pkgdir}/usr/bin"

  echo "java -jar /usr/share/${_pkgname}/VncViewer.jar" > "${pkgdir}/usr/bin/${_pkgname}"
  chmod +x "${pkgdir}/usr/bin/${_pkgname}"
  install -m644 "platform_external_tigervnc-desktop-mode_v${pkgver}/java/VncViewer.jar" "${pkgdir}/usr/share/${_pkgname}"
  install -m644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -m644 "platform_external_tigervnc-desktop-mode_v${pkgver}/java/com/tigervnc/vncviewer/tigervnc.png" "${pkgdir}/usr/share/icons/${_pkgname}.png"

}

