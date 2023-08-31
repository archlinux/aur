# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Jesse Spangenberger <azulephoenix@gmail.com>
# Maintainer: Simon Zack <simonzack@gmail.com>
# Contributor: Tristelune <tristelune@archlinux.info>

_pkgname=PDFStudio
pkgname=${_pkgname,,}-bin
_pkgver=2023
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
sha256sums=('084db3f4bd9445c033492aaea508b9b75d5bae7da90ffe4384a940e2fb364a35'
            'dc8dac6cd3276e35489ebad93fbaacf77ee1e0892bb74fa70c3b4179a15b75ce'
            '58697d0f825034fb3bde39699884d816eba9505974ff83e8e76e0cffc11a0019')

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
