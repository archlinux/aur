# Maintainer: Thomas Kuther <tom@kuther.net>
pkgname=keystore-explorer
_pkgname=kse
pkgver=5.0.1
_pkgver=${pkgver//./}
pkgrel=1
pkgdesc="a free GUI replacement for the Java command-line utilities keytool, jarsigner and jadtool"
arch=('i686' 'x86_64')
url="http://keystore-explorer.sourceforge.net/"
license=('GPL')
depends=('java-runtime' 'java-jce_ustrength')
install=${pkgname}.install
source=("https://downloads.sourceforge.net/project/keystore-explorer/KSE%20${pkgver}/${_pkgname}-${_pkgver}-manual.zip"
        "${pkgname}.desktop")
md5sums=('14285788e99b5fd082716d3a18f28c3b'
         'dfaa247ab726fe2e44368101399b508d')

package() {
  cd "$srcdir"

  install -d "${pkgdir}/usr/lib/${pkgname}"
  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/applications"

  install -D -m644 *.jar "${pkgdir}/usr/lib/${pkgname}"
  install -D -m644 readme.txt "${pkgdir}/usr/share/doc/${pkgname}"
  install -D -m644 license-*.txt "${pkgdir}/usr/share/licenses/${pkgname}"

  # install wrapper
  echo -e "#!/bin/sh\ncd /usr/lib/${pkgname}\njava -jar kse.jar" > kse
  install -D -m755 kse "${pkgdir}/usr/bin"

  # install .desktop
  for i in 16 32 48 128 256 512; do
    jar xf kse.jar net/sf/keystore_explorer/gui/images/kse-${i}x${i}.png
    install -D -m644 net/sf/keystore_explorer/gui/images/kse-${i}x${i}.png "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/kse.png"
  done
  install -D -m644 ${pkgname}.desktop "${pkgdir}/usr/share/applications"
}


# vim:set ts=2 sw=2 et:
