# Maintainer: bzt <unmacaque at gmail.com>

pkgname=dbgl
pkgver=0.82
pkgrel=2
pkgdesc="An open-source, free, multi-platform frontend for DOSBox (DOSBox binaries not included)"
arch=('any')
url="http://members.quicknet.nl/blankendaalr/dbgl/"
license=('GPL')
depends=('java-runtime>=7' 'java-runtime<9' 'gtk2')
optdepends=('dosbox: necessary to run DOS games')
source=("http://members.quicknet.nl/blankendaalr/dbgl/download/${pkgname}082_generic.tar.gz"
        dbgl.desktop
        dbgl.sh)
sha256sums=('a3aad160c3baec6e1bb96a34e9570c94eaaba70bc34dfa92c90e918608377ca9'
            '7da06d297b5cbdbc1029c58ffe1c6643ae0fa3fe597e839b26d03ff3900de00d'
            '2d2a4e74d5cec80b11953b3a7eec6cff15faccc8726c8ba99b8088718259dc7a')

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
