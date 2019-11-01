# Maintainer: Auteiy <dmitry@auteiy.me>
pkgname=otf-san-francisco-compact
pkgver=1.0
pkgrel=1
epoch=1
pkgdesc='This sans-serif typeface is the system font for watchOS, and includes a rounded variant. It suits a wide range of content and is easily legible in a variety of contexts.'
arch=('any')
license=('custom')
url='https://developer.apple.com/fonts/'
depends=('fontconfig' 
		 'xorg-font-utils')
source=(SFCompact-"$pkgver"-"$pkgrel".zip::"$url"downloads/SFCompact.zip)
sha256sums=('4792e19118de169af15bf0a8dbc9ee9e525aa6e17e1d12e9f5f94680a11d486d')

package() {
  cd "$srcdir/SFCompact"

  mkdir pkg
  bsdtar xvPf 'San Francisco Compact.pkg' || true
  bsdtar xvPf 'San Francisco Compact.pkg/Payload'

  install -d $pkgdir/usr/share/fonts/OTF/
  install -m644 Library/Fonts/*.otf $pkgdir/usr/share/fonts/OTF/

  install -d $pkgdir/usr/share/licenses/$pkgname/
  install -m644 'SF Compact Font License.rtf' $pkgdir/usr/share/licenses/$pkgname/LICENSE.rtf
}
