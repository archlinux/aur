# Maintainer: Jesús Castro (51v4n) <51v4n@openmailbox.org>

pkgname=otf-san-francisco
pkgver=1.1
pkgrel=2
pkgdesc='The system font for macOS, iOS, watchOS, and tvOS'
arch=('any')
license=('custom')
url='https://developer.apple.com/fonts/' 
depends=('fontconfig' 'xorg-font-utils' 'cpio')
makedepends=('xar')
source=("https://developer.apple.com/fonts/downloads/SFPro.zip")
sha256sums=('61d21ddba98b73f96f4c256aba92e490448f80c346e934245627cedbf8d3291f')

package() {
  cd "$srcdir/SFPro"

  mkdir pkg
  xar -xf 'San Francisco UI.pkg' -C pkg
  gunzip -dc "pkg/San Francisco UI.pkg/Payload" | cpio -i

  install -d $pkgdir/usr/share/fonts/OTF/
  install -m644 Library/Fonts/*.otf $pkgdir/usr/share/fonts/OTF/

  install -d $pkgdir/usr/share/licenses/$pkgname/
  install -m644 'SF UI Font License.rtf' $pkgdir/usr/share/licenses/$pkgname/LICENSE.rtf
}
