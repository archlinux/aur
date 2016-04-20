# Maintainer: Pieter Goetschalckx <3.14.e.ter at gmail dot com>

pkgname=stremio-bin
pkgver=3.5.10
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
md5sums=('49f40ee35ee6cb1855648edd6beec1f5'
         '17a3ae27d06908138317c3a9b8d03898'
         'e3b38592637449733618d73b45293b09'
         '218fad56add848a58785d68dbfae02ae')

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

