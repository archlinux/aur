# $Id$
# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=noto-fonts-lite
_pkgver=2017-03-07
_commit=60aa0da2ee84b11e78725b4577edc2e80b009d56  # master
pkgver=${_pkgver//-}
pkgrel=1
pkgdesc="Google Noto TTF fonts (lite version)"
arch=(any)
url="https://www.google.com/get/noto/"
license=(custom:SIL)
provides=(ttf-font noto-fonts)
conflicts=(noto-fonts)
source=("noto-fonts-$_commit.tar.gz::https://github.com/googlei18n/noto-fonts/archive/$_commit.tar.gz"
        66-noto-sans.conf 66-noto-serif.conf 66-noto-mono.conf)
sha256sums=('9d74d9fa04dfa182b8fa1a3caca3b65cc929b76e169bf59c6ce8c78b9c08be82'
            '65ff237a579d438eb1b1c90bf25b5818e15ab019dbbfed2fc283b9cd12e5177f'
            '27419c0557d05e13edbb244cd06a62d921c271c6c2f07126856519869035776e'
            '8c541eab8b44f6c7b02e981a4fbbd082eb6c1aa8285e11dede5f0a3ec0617772')

package_noto-fonts-lite() {
  optdepends=('noto-fonts-cjk: CJK characters' 'noto-fonts-emoji: Emoji characters')

  cd noto-fonts-*/
  mkdir -p "$pkgdir"/usr/share/fonts/noto
  # overwritten by the hinted version
  #install -m644 unhinted/NotoMono-*.tt[fc] "$pkgdir"/usr/share/fonts/noto
  #install -m644 unhinted/NotoSans-*.tt[fc] "$pkgdir"/usr/share/fonts/noto
  #install -m644 unhinted/NotoSerif-*.tt[fc] "$pkgdir"/usr/share/fonts/noto
  install -m644 hinted/NotoMono-*.tt[fc] "$pkgdir"/usr/share/fonts/noto
  install -m644 hinted/NotoSans-*.tt[fc] "$pkgdir"/usr/share/fonts/noto
  install -m644 hinted/NotoSerif-*.tt[fc] "$pkgdir"/usr/share/fonts/noto
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/noto-fonts/LICENSE

  # Install fontconfig files
  mkdir -p "$pkgdir"/etc/fonts/conf.avail
  install -m644 "$srcdir"/*.conf "$pkgdir"/etc/fonts/conf.avail/
}
