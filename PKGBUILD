# Maintainer: Nick <nift4@protonmail.com>
# Contributor: ikeramat <ikeramat@protonmail.com>
pkgname=lmo-desktop-mode-git
_pkgname=lmo-desktop-mode
pkgver=1.0.0
pkgrel=4
pkgdesc="Client and companion application for LibreMobileOS desktop mode"
arch=('x86_64')
license=('GPL-2.0-only')
url='https://libremobileos.com'
depends=('jre-openjdk' 'android-tools' 'android-udev')
makedepends=('make' 'cmake' 'unzip')
source=(${_pkgname}.desktop
        "https://github.com/nift4/external_tigervnc/archive/refs/heads/master.zip")
sha256sums=('SKIP'
            'SKIP')
prepare() {
  unzip master.zip
  cd external_tigervnc-master/java
  cmake .
}
build() {
  cd external_tigervnc-master/java
  make
}
package() {
  install -d "${pkgdir}/usr/share/${_pkgname}"
  install -d "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/share/icons"
  install -m644 "external_tigervnc-master/java/VncViewer.jar" "${pkgdir}/usr/share/${_pkgname}"
  install -m644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -m644 "external_tigervnc-master/java/com/tigervnc/vncviewer/tigervnc.png" "${pkgdir}/usr/share/icons/${_pkgname}.png"

}

