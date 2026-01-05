# Maintainer: Thomas Kuther <tom@kuther.net>
# Maintainer: Alexandre Berthaud <alexandre at berthaud dot me>
pkgname=keystore-explorer-bin
_reponame=keystore-explorer
_pkgname=kse
pkgver=5.6.1
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
sha256sums=('b242289d1c8931d202c2e8b17fd076a1e97827fd42c700126c8910fc7bdf8981'
            '7bd18c7225e1bbec38ae3b7babf337ece34b0b260645c74a40405a78e967c6bb')

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
