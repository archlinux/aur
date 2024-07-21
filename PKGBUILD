# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Jesse Spangenberger <azulephoenix@gmail.com>
# Maintainer: Simon Zack <simonzack@gmail.com>
# Contributor: Tristelune <tristelune@archlinux.info>

_pkgname=PDFStudio
pkgname=${_pkgname,,}-bin
_pkgver=2024
pkgver=$_pkgver.0.1
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
sha256sums=('320962c9cd9f8ab8cdb49a9060dc756db2f99c82b8ca548d066a7a8b58942d3d'
            'dc8dac6cd3276e35489ebad93fbaacf77ee1e0892bb74fa70c3b4179a15b75ce'
            '769b699163e5a1ca7853d412a7e0094ce495580dd146cf06ac57d78426333897')

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
