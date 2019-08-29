# Maintainer: Harry Beadle <harrybeadle@protonmail.com>

pkgname=otf-san-francisco-mono
pkgver=1
pkgrel=1
pkgdesc='Monospaced variant of San Francisco. Sources directly from Apple.'
arch=('any')
url='https://developer.apple.com/fonts/'
license=('custom')
makedepends=('p7zip' 'dmg2img' 'cpio' 'xar' 'gzip')
source=('https://developer.apple.com/design/downloads/SF-Mono.dmg')
md5sums=('da5cc357ca677b57454e7cacb336d036')

prepare() {
  dmg2img SF-Mono.dmg SF-Mono.img
  7z x SF-Mono.img
  xar -xf "SFMonoFonts/SF Mono Fonts.pkg"
  cat SFMonoFonts.pkg/Payload | gunzip -dc | cpio -i
}

package() {
  cd 'Library/Fonts/'
  install -d "${pkgdir}"/usr/share/fonts/apple
  install -m644 *.otf "${pkgdir}"/usr/share/fonts/apple/
}

