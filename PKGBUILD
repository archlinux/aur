# Maintainer: bzt <unmacaque at gmail.com>

pkgname=dbgl
pkgver=0.81
pkgrel=1
pkgdesc="An open-source, free, multi-platform frontend for DOSBox (DOSBox binaries not included)"
arch=('any')
url="http://members.quicknet.nl/blankendaalr/dbgl/"
license=('GPL')
depends=('java-runtime>=7' 'gtk2')
optdepends=('dosbox: necessary to run DOS games')
source=("http://members.quicknet.nl/blankendaalr/dbgl/download/${pkgname}081_generic.tar.gz"
        dbgl.desktop
        dbgl.sh)
md5sums=('9eade29c459caf2fa02901a684750070'
         'aaf6ffc4a18ab0e5444cb37422a4e3ee'
         '897eb9e309e2b30820a2be439292b799')

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
