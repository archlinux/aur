# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Jesse Spangenberger <azulephoenix@gmail.com>
# Maintainer: Simon Zack <simonzack@gmail.com>
# Contributor: Tristelune <tristelune@archlinux.info>

_pkgname=PDFStudio
pkgname=${_pkgname,,}-bin
_pkgver=2022
pkgver=$_pkgver.2.2
pkgrel=1
pkgdesc='Review, annotate, and edit PDF Documents'
arch=(x86_64)
url='https://www.qoppa.com/pdfstudio/'
license=(custom)
depends=('java-runtime>=17')
provides=("${pkgname%-bin}=$pkgver")
conflicts=("${pkgname%-bin}")
replaces=("${pkgname%-bin}")
source=("${pkgname%-bin}.desktop"
        "${pkgname%-bin}.png"
        "https://download.qoppa.com/${pkgname%-bin}/v$_pkgver/${_pkgname}_v${pkgver//./_}_linux64.deb")
sha256sums=('b31863787364055ab0807ecf28a5bc5ac2af6299f6563018871d4c3ed5f5f00f'
            'dc8dac6cd3276e35489ebad93fbaacf77ee1e0892bb74fa70c3b4179a15b75ce'
            '08fd9c0a6bde75027fc63656438c23e94651a82b14e6a2b74daf374d4549cadb')

prepare() {
  bsdtar xf data.tar.gz
  bsdtar xf "opt/${pkgname%-bin}$_pkgver/lib/pdfstudio.jar" resources/license.html
  rm -rf "opt/${pkgname%-bin}$_pkgver/jre"
}

package() {
  install -Dm644 -t "$pkgdir/usr/share/applications/" "${pkgname%-bin}.desktop"
  install -Dm644 -t "$pkgdir/usr/share/pixmaps/" "${pkgname%-bin}.png"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" resources/license.html
  install -dm 755 "$pkgdir/usr/share/"
  cp -r "opt/${pkgname%-bin}$_pkgver" "$pkgdir/usr/share/${pkgname%-bin}"
  install -dm 755 "$pkgdir/usr/bin"
  ln -sf "/usr/share/${pkgname%-bin}/${pkgname%-bin}$_pkgver" "$pkgdir/usr/bin/${pkgname%-bin}"
}
