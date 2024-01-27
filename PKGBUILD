# Maintainer: Thomas Kuther <tom@kuther.net>
# Maintainer: Alexandre Berthaud <alexandre at berthaud dot me>
pkgname=keystore-explorer-bin
_reponame=keystore-explorer
_pkgname=kse
pkgver=5.5.3
_pkgver=${pkgver//./}
pkgrel=1
pkgdesc="A free GUI replacement for the Java command-line utilities keytool, jarsigner and jadtool"
arch=('i686' 'x86_64')
url="http://www.keystore-explorer.org/"
license=('GPL')
depends=('java-runtime')
conflicts=('keystore-explorer')
install=${pkgname}.install
source=("https://github.com/kaikramer/${_reponame}/releases/download/v${pkgver}/${_pkgname}-${_pkgver}.zip"
        "${_reponame}.desktop")
md5sums=('3602ed825bce56c0326e0bfaf3c1cd4c'
         'dfaa247ab726fe2e44368101399b508d')

package() {
  cd "${srcdir}/${_pkgname}-${_pkgver}"

  install -d "${pkgdir}/usr/lib/${pkgname}/lib"
  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/applications"

  install -D -m644 *.jar "${pkgdir}/usr/lib/${pkgname}"
  install -D -m755 kse.sh "${pkgdir}/usr/lib/${pkgname}"
  install -D -m644 readme.txt "${pkgdir}/usr/share/doc/${pkgname}"
  install -D -m644 licenses/*.txt "${pkgdir}/usr/share/licenses/${pkgname}"
  install -D -m644 lib/*.jar "${pkgdir}/usr/lib/${pkgname}/lib"

  ln -sf "/usr/lib/${pkgname}/kse.sh" "${pkgdir}/usr/bin/kse"

  # install .desktop
  for i in 16 32 48 128; do
    install -D -m644 icons/kse_${i}.png "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/kse.png"
  done
  install -D -m644 "${srcdir}/${_reponame}.desktop" "${pkgdir}/usr/share/applications"
}


# vim:set ts=2 sw=2 et:
