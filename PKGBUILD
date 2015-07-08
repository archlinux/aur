# Maintainer: Charles Bos <charlesbos1 AT gmail>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Colin Shea <colins@evaryont.ath.cx>

pkgname=cave9
pkgver=0.4
_dataver=4
pkgrel=2
pkgdesc="A 3D gravity cave-exploration game based on the classic SFCave"
arch=('i686' 'x86_64')
url="http://code.google.com/p/cave9/"
license=('LGPL3' 'custom')
depends=('mesa' 'sdl_image' 'sdl_ttf')
source=("http://cave9.googlecode.com/files/${pkgname}_src-${pkgver}.tgz"
        "http://cave9.googlecode.com/files/${pkgname}_data-${_dataver}.tgz"
        "${pkgname}.desktop")
sha256sums=('285fd1070e9fadade890ddd64f30db6bcfeaa5326c99d6e69744abab80da93d8'
            '89a1ef99f2399bf7638b25ce4b51c5c088e01c29bc407eab689ccbb39c5b8d39'
            '37b2fb322113f616b6794027ef309487dd0270eb17e436a499b2ef66c29da085')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  CFLAGS='-Wno-error=cpp' LDFLAGS='' make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Install binary
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  # Install data files
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  cp ../data/*.{jpg,png,ttf,wav} "${pkgdir}/usr/share/${pkgname}"

  # Install pixmap and .desktop file
  install -Dm644 "../data/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "../${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install documentation and licenses
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 AUTHORS.txt README.txt "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 ../data/README.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE_DATA.txt"
}

# vim:set ts=2 sw=2 et:
