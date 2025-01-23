# Maintainer: bzt <unmacaque at gmail dot com>

pkgname=dbgl
pkgver=0.99
pkgrel=1
pkgdesc="An open-source, free, multi-platform frontend for DOSBox"
arch=('x86_64')
url="https://dbgl.org/"
license=('GPL')
depends=('java-runtime>=17')
optdepends=('dosbox: necessary to run DOS games')
source=("https://dbgl.org/download/${pkgname}${pkgver//.}.tar.xz"
        dbgl.desktop
        dbgl.sh)
sha256sums=('60b072136428284bf622d250bc0b28e16878387a75adf3afa4817b64957bdf57'
            '7da06d297b5cbdbc1029c58ffe1c6643ae0fa3fe597e839b26d03ff3900de00d'
            'ec0f5d86d8a76b9ec2ee60e3e28b8ad5008df70eb86e28575b75dd0d2b1fd509')

package() {
  cd "$srcdir"

  install -dm755 "$pkgdir/usr/share/java/$pkgname"
  install -m755 dbgl "$pkgdir/usr/share/java/$pkgname"
  install -m644 COPYING \
    dbgl.jar \
    dbgl.png \
    "$pkgdir/usr/share/java/$pkgname"

  for dir in captures db dosroot export lib profiles templates xsl; do
    mv "$dir" "$pkgdir/usr/share/java/$pkgname"/
  done

  install -dm755 "$pkgdir"/usr/bin
  install -m755 dbgl.sh "$pkgdir"/usr/bin/dbgl

  install -dm755 "$pkgdir"/usr/share/icons/hicolor/256x256/apps
  install -m644 dbgl.png "$pkgdir"/usr/share/icons/hicolor/256x256/apps

  install -dm755 "$pkgdir"/usr/share/applications
  install -m644 dbgl.desktop "$pkgdir"/usr/share/applications

  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname"
}
