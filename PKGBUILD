# Maintainer: Nico <d3sox at protonmail dot com>
# Contributor: Harry Beadle <harrybeadle@protonmail.com>
pkgname=otf-san-francisco-mono
pkgver=1
pkgrel=7
pkgdesc='Monospaced variant of San Francisco. Sourced directly from Apple.'
arch=('any')
url='https://developer.apple.com/fonts/'
license=('custom')
makedepends=('p7zip')
source=("SF-Mono-$pkgrel.dmg::https://developer.apple.com/design/downloads/SF-Mono.dmg")
sha256sums=('76c415e9aee0524087cc6a042113db6b38f1a19f2e286f807aa29756461370a9')

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

