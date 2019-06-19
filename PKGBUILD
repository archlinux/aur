# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: filthyAUR

pkgname=losslesscut
pkgver=2.3.0
pkgrel=1
pkgdesc="Crossplatform GUI tool for lossless trimming/cutting of video/audio files"
arch=('x86_64')
url="https://github.com/mifi/lossless-cut"
license=('MIT')
depends=('ffmpeg' 'gtk2' 'nss' 'gconf')
makedepends=('asar')
source_x86_64=(losslesscut_${pkgver}.zip::"https://github.com/mifi/lossless-cut/releases/download/v${pkgver}/LosslessCut-linux-x64.zip" "losslesscut.desktop")

package()
{
  cd "$srcdir"
  mkdir -p $pkgdir/usr/{share/losslesscut,bin}
  cd LosslessCut-linux-x64
  asar ef resources/app.asar icon.svg 
  tar -cf - --exclude app.asar.unpacked --exclude icon.svg . | tar -C "$pkgdir/usr/share/losslesscut" -xvf -
  ln -s /usr/share/losslesscut/LosslessCut $pkgdir/usr/bin/losslesscut
  install -Dm644 ../$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -Dm644 icon.svg "$pkgdir"/usr/share/pixmaps/$pkgname.svg
  }

md5sums_x86_64=('eb112b89da5da0c5a0d1210ade80656e'
                '460a126a50892d91bdc53de7fa3bc182')
