# Maintainer: Nico <d3sox at protonmail dot com>
# Contributor: Harry Beadle <harrybeadle@protonmail.com>
pkgname=otf-san-francisco-mono
pkgver=1
pkgrel=13
pkgdesc='Monospaced variant of San Francisco. Sourced directly from Apple.'
arch=('any')
url='https://developer.apple.com/fonts/'
license=('custom')
makedepends=('p7zip')
source=("SF-Mono-$pkgrel.dmg::https://developer.apple.com/design/downloads/SF-Mono.dmg")
sha256sums=('b591d5ea0e36ef3a98ceb35fdf00b0882879563a3c3c06a2f6e12f6b260fb233')

prepare() {
  # remove previous files
  rm -rf SFMonoFonts
  # extract dmg
  7z x "SF-Mono-$pkgrel.dmg"
  # extract pkg
  bsdtar xvPf "SFMonoFonts/SF Mono Fonts.pkg"
  bsdtar xvPf "SFMonoFonts.pkg/Payload"
}

package() {
  # install fonts
  install -d "$pkgdir/usr/share/fonts/apple"
  install -m644 "Library/Fonts/"*.otf "$pkgdir/usr/share/fonts/apple"

  # install license
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 Resources/English.lproj/License.rtf "$pkgdir/usr/share/licenses/$pkgname/LICENSE.rtf"
}

