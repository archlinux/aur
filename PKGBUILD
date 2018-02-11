# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=losslesscut
pkgver=1.9.0
pkgrel=2
pkgdesc="Crossplatform GUI tool for lossless trimming/cutting of video/audio files"
arch=('i686' 'x86_64')
url="https://github.com/mifi/lossless-cut"
license=('MIT')
depends=('ffmpeg' 'gtk2' 'nss' 'gconf')
source_i686=("https://github.com/mifi/lossless-cut/releases/download/v${pkgver}/LosslessCut-linux-ia32.zip" "losslesscut.desktop")
source_x86_64=("https://github.com/mifi/lossless-cut/releases/download/v${pkgver}/LosslessCut-linux-x64.zip" "losslesscut.desktop")

package()
{
  cd "$srcdir"
  mkdir -p $pkgdir/usr/{share/losslesscut,bin}
  if [ $CARCH = "x86_64" ]
  then
    cd LosslessCut-linux-x64
  else
    cd LosslessCut-linux-ia32
  fi
  tar -cf - --exclude app.asar.unpacked . | tar -C "$pkgdir/usr/share/losslesscut" -xvf -
  ln -s /usr/share/losslesscut/LosslessCut $pkgdir/usr/bin/losslesscut
  install -Dm644 ../$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -Dm644 $pkgdir/usr/share/losslesscut/resources/icon.svg "$pkgdir"/usr/share/pixmaps/$pkgname.svg
  }

md5sums_i686=('a9ce642513ffde905bfca3a47170a7c4'
              '460a126a50892d91bdc53de7fa3bc182')
md5sums_x86_64=('da42d6971af2344990504a67f61f3ad8'
                '460a126a50892d91bdc53de7fa3bc182')
