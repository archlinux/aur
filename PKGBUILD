# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: filthyAUR

pkgname=losslesscut
pkgver=2.6.2
pkgrel=2
pkgdesc="Crossplatform GUI tool for lossless trimming/cutting of video/audio files"
arch=('x86_64')
url="https://github.com/mifi/lossless-cut"
license=('MIT')
depends=('ffmpeg' 'gtk2' 'nss')
makedepends=('asar')
source_x86_64=(losslesscut_${pkgver}.zip::"https://github.com/mifi/lossless-cut/releases/download/v2.6.2/lossless-cut-2.6.2.tar.bz2" "losslesscut.desktop")

package()
{
  cd "$srcdir"
  mkdir -p $pkgdir/usr/{share/losslesscut,bin}
  cd lossless-cut-${pkgver}
  asar ef resources/app.asar build/icon.svg
  tar -cf - --exclude app.asar.unpacked --exclude icon.svg . | tar -C "$pkgdir/usr/share/losslesscut" -xvf -
  ln -s /usr/share/losslesscut/lossless-cut $pkgdir/usr/bin/losslesscut
  install -Dm644 ../$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -Dm644 icon.svg "$pkgdir"/usr/share/pixmaps/$pkgname.svg
  }

md5sums_x86_64=('bd109224c3eee4a815509b592c10957f'
                '460a126a50892d91bdc53de7fa3bc182')
