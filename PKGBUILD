# Maintainer: Nico <d3sox at protonmail dot com>
# Contributor: Harry Beadle <harrybeadle@protonmail.com>
pkgname=otf-san-francisco-mono
pkgver=1
pkgrel=10
pkgdesc='Monospaced variant of San Francisco. Sourced directly from Apple.'
arch=('any')
url='https://developer.apple.com/fonts/'
license=('custom')
makedepends=('p7zip')
source=("SF-Mono-$pkgrel.dmg::https://developer.apple.com/design/downloads/SF-Mono.dmg")
sha256sums=('8e78534e64b2e49f0c268b5bb08f20e61c68b608efc836dc7329a3001c1a8d8c')

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

