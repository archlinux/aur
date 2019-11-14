# Maintainer: Harry Beadle <harrybeadle@protonmail.com>

pkgname=otf-san-francisco-pro
pkgver=1
pkgrel=2
pkgdesc='System font for iOS, macOS, and tvOS. Sourced directly from Apple.'
arch=('any')
url='https://developer.apple.com/fonts/'
license=('custom')
makedepends=('p7zip' 'dmg2img' 'cpio' 'xar' 'gzip')
source=('https://developer.apple.com/design/downloads/SF-Font-Pro.dmg')
md5sums=('da1f767a3d185cac4efe9003aefc082a')

prepare() {
  dmg2img SF-Font-Pro.dmg SF-Font-Pro.img
  7z x SF-Font-Pro.img
  xar -xf "SanFranciscoPro/San Francisco Pro.pkg"
  cat SanFranciscoPro.pkg/Payload | gunzip -dc | cpio -i
}

package() {
  cd 'Library/Fonts'
  install -d "${pkgdir}"/usr/share/fonts/apple/
  install -m644 *.otf "${pkgdir}"/usr/share/fonts/apple/
}

