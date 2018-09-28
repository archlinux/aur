# Maintainer: Thomas Kuther <tom@kuther.net>
# Maintainer: Alexandre Berthaud <alexandre at berthaud dot me>
pkgname=keystore-explorer
_pkgname=kse
pkgver=5.4.0
_pkgver=${pkgver//./}
pkgrel=1
pkgdesc="a free GUI replacement for the Java command-line utilities keytool, jarsigner and jadtool"
arch=('i686' 'x86_64')
url="http://www.keystore-explorer.org/"
license=('GPL')
depends=('java-runtime')
install=${pkgname}.install
source=("https://github.com/kaikramer/${pkgname}/releases/download/v${pkgver}/${_pkgname}-${_pkgver}.zip"
        "${pkgname}.desktop")
md5sums=('e78a51ab2c9120560dba8ba1e165954d'
         'dfaa247ab726fe2e44368101399b508d')

package() {
  cd "${srcdir}/${_pkgname}-${_pkgver}"

  install -d "${pkgdir}/usr/lib/${pkgname}/lib"
  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/applications"

  install -D -m644 *.jar "${pkgdir}/usr/lib/${pkgname}"
  install -D -m644 readme.txt "${pkgdir}/usr/share/doc/${pkgname}"
  install -D -m644 licenses/license-*.txt "${pkgdir}/usr/share/licenses/${pkgname}"
  install -D -m644 lib/*.jar "${pkgdir}/usr/lib/${pkgname}/lib"

  # install wrapper
  echo -e "#!/bin/sh\ncd /usr/lib/${pkgname}\njava -jar kse.jar" > kse
  install -D -m755 kse "${pkgdir}/usr/bin"

  # install .desktop
  for i in 16 32 48 128; do
    install -D -m644 icons/kse_${i}.png "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/kse.png"
  done
  install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications"
}


# vim:set ts=2 sw=2 et:
