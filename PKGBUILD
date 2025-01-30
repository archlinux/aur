# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Charles Bos <charlesbos1 AT gmail>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Colin Shea <colins@evaryont.ath.cx>

pkgname=cave9
pkgver=0.4.1
_dataver=4
pkgrel=1
pkgdesc="A 3D gravity cave-exploration game based on the classic SFCave"
arch=('i686' 'x86_64')
url="https://code.google.com/p/cave9/"
license=('LGPL-3.0-or-later')
depends=('mesa' 'sdl_image' 'sdl_ttf')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bart9h/cave9/archive/refs/tags/${pkgver}.tar.gz"
        "https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/${pkgname}/${pkgname}_data-${_dataver}.tgz"
        "${pkgname}.desktop")
sha256sums=('b5978025c834fcfd6330c0537a70ebe5d9c17bcd04542d4ef6b5505f59d93622'
            '89a1ef99f2399bf7638b25ce4b51c5c088e01c29bc407eab689ccbb39c5b8d39'
            '37b2fb322113f616b6794027ef309487dd0270eb17e436a499b2ef66c29da085')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  CFLAGS='-Wno-error=cpp -Wno-error=int-in-bool-context -Wno-format-truncation' LDFLAGS='' make
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
