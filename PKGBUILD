# Maintainer: Dmitri Goutnik <dg@syrec.org>

_pkgname=encryptpad
pkgname=${_pkgname}-git
pkgver=0.4.0.2.r2.g55fd374
pkgrel=1
pkgdesc="Minimalist secure text editor and binary encryptor that implements RFC 4880 Open PGP format"
arch=('i686' 'x86_64')
url="https://github.com/evpo/EncryptPad"
license=('GPL2')
depends=('qt5-base' 'hicolor-icon-theme' 'botan-with-compression')
conflicts=('encryptpad')
makedepends=('git')
source=("${_pkgname}-${pkgver}::git+git://${url#*//}.git")
options=('!makeflags')
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}-${pkgver}
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}
 
build() {
  cd ${_pkgname}-${pkgver}
  ./configure.sh --all --use-system-libs
}

package() {
  cd ${_pkgname}-${pkgver}
  install -Dm755 -t "${pkgdir}/usr/bin" bin/release/{encryptcli,encryptpad}
  install -Dm644 encryptpad.desktop "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 encryptpad.xml "${pkgdir}/usr/share/mime/application/${_pkgname}.xml"
  install -Dm644 images/icns.iconset/icon_16x16.png "${pkgdir}/usr/share/icons/hicolor/16x16/apps/${_pkgname}.png"
  install -Dm644 images/icns.iconset/icon_32x32.png "${pkgdir}/usr/share/icons/hicolor/32x32/apps/${_pkgname}.png"
  install -Dm644 images/icns.iconset/icon_128x128.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png"
  install -Dm644 images/icns.iconset/icon_256x256.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"
}
