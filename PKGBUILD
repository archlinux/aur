# Maintainer: Dhruva Sambrani <dhruvasambrani19 at gmail dot com>

pkgname=ttf-tiro-indigo-bin
pkgdesc="Tiro Indigo Indic Typefaces, based on the series of fonts for Harvard's Murty Classical Library of India. Includes Bangla (Bengali), Devanagari (Hindi, Sanskrit and Marathi variants), Gurmukhi (Punjabi), Kannada, Tamil and Telugu"
_fonttype=${pkgname/-*/} # otf/ttf
pkgver=1.65
pkgrel=1
arch=(any)
url="https://github.com/TiroTypeworks/Indigo"
license=('OFL')
provides=('ttf-tiro-indigo')
conflicts=('ttf-tiro-indigo' 'ttf-tiro-indigo-git')
source=("$pkgname.zip::https://github.com/TiroTypeworks/Indigo/releases/download/v${pkgver}/fonts.zip")
sha256sums=('1420bb50a1ae8efdd133c75577b01b5876439c717e50861036e055e15c17e5f9')

package() {
  local fontdir="$pkgdir/usr/share/fonts/TiroIndigo-$_fonttype"
  mkdir -p "$fontdir"
  for lang in Bangla DevaHindi DevaMarathi DevaSanskrit Gurmukhi Kannada Tamil Telugu; do
    local src_fontdir="$srcdir/fonts/Tiro${lang}/${_fonttype^^}"
    install -m644 "$src_fontdir"/*."$_fonttype" -t "$fontdir"
  done
  install -Dm644 "$srcdir/fonts/OFL.txt" "$pkgdir/usr/share/licenses/$pkgname/OFL.txt"
}
