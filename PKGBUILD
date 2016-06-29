# Maintainer: Rob Lynn <rob22uk at gmail dot com>

pkgname=stremio-bin
pkgver=3.6.2
pkgrel=1
pkgdesc="Watch instantly all the video content you enjoy in one place."
arch=('x86_64')
url="https://strem.io"
depends=('ffmpeg' 'gconf')
license=('custom')
install=stremio.install
source=("https://strem.io/Stremio${pkgver}.linux.tar.gz"
        "https://strem.io/favicon-32x32.png"
        "https://strem.io/favicon-96x96.png"
        "stremio.desktop")
sha512sums=('672608fc8da218a41fbb1f5fdd6d7f72da44eacb60139262e7fd3f4f15ac87b1b586b6c60e1a3adb37dbee8dba98c0197cc97c16809ad36b6c46e33015718296'
            '09c8fa78e477ee1919f7fa54265afb73528d51453dbf92ff0fab433792c0f9d33dd7dd826a60822a24c8027fdc2b383228cd58bb014519ee93fdb651d639d27d'
            '58fcbb09a2f8b8c83102b62449f5e483f6d6e60a764f728bd54ece313908622e32b27e3fa4909047ec54850b50322af5d1315abdb3740e60d75049faab913467'
            'ae61a03eb6b1318e92d159de8e2c09a45b5fb4a665089aa11c3c99225978b0f864b84d6587b30fca96c559c2e8384db5140a41a23193790937ca654eb67821ff')

prepare() {
  sed -i "s#\$(dirname \$0)#/usr/share/stremio#" Stremio.sh
}

package() {
  install -Dm644 stremio.desktop "$pkgdir/usr/share/applications/stremio.desktop"
  install -Dm644 favicon-32x32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/stremio.png"
  install -Dm644 favicon-96x96.png "$pkgdir/usr/share/icons/hicolor/96x96/apps/stremio.png"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/stremio/LICENSE"
  install -Dm755 Stremio.sh "$pkgdir/usr/bin/stremio"

  install -dm755 "$pkgdir/usr/share/stremio"

  install -Dm644 content_shell.pak "$pkgdir/usr/share/stremio/"
  install -Dm644 icudtl.dat "$pkgdir/usr/share/stremio/"
  install -Dm644 libgcrypt.so.11 "$pkgdir/usr/share/stremio/"
  install -Dm644 libnode.so "$pkgdir/usr/share/stremio/"
  install -Dm644 libnotify.so.4 "$pkgdir/usr/share/stremio/"
  install -Dm644 natives_blob.bin "$pkgdir/usr/share/stremio/"
  install -Dm644 snapshot_blob.bin "$pkgdir/usr/share/stremio/"
  install -Dm755 Stremio-runtime "$pkgdir/usr/share/stremio/"
  install -Dm644 version "$pkgdir/usr/share/stremio/"

  cp -pr locales "$pkgdir/usr/share/stremio/"
  cp -pr resources "$pkgdir/usr/share/stremio/"
  cp -pr WCjs "$pkgdir/usr/share/stremio/"
}

# vim:set ts=2 sw=2 et:

