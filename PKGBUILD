# Maintainer: Daniel Desancic <arch at malfunc dot org>

pkgname=roomeqwizard-beta
pkgver=5.19_beta9
_pkgver=5_19_beta9
pkgrel=2
pkgdesc="A room acoustics analysis software for measuring and analysing room and loudspeaker responses. Beta version!"
arch=("any")
url="http://www.roomeqwizard.com"
license=("custom")
depends=("java-environment")
DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u --cookie cookies.txt")
source=("https://www.avnirvana.com/resources/rew-linux-installer-requires-java-7-or-8.18/download?version=55" 
         "cookies.txt")
sha512sums=("8e15369d2009d87561975cd29c1c074ba00899623a5d3dbb042d8acbdcf34d7dfd7fb77ca5603e09f4099377fb025018e80635d7a53ab1b822c96cb1693f57a9"
            "56a5f4cd5a288feae6e55c896f354bc067340657b92d43ad13c51db9d13b8fd10cb77281b17aa16a252d4c9e85c586372656c4a286cdb5d37dc7719102132a5f")

package() {
    sh "download?version=55" -q -dir "$pkgdir/usr/lib/$pkgname"

    mkdir -p "$pkgdir/usr/bin" \
        "$pkgdir/usr/share/licenses/$pkgname" \
        "$pkgdir/usr/share/doc/$pkgname" \
        "$pkgdir/usr/share/applications/$pkgname"
  
  ln -s "/usr/lib/$pkgname/roomeqwizard" "$pkgdir/usr/bin/$pkgname"
  mv "$pkgdir/usr/lib/$pkgname/EULA.html" "$pkgdir/usr/share/licenses/$pkgname/"
  mv "$pkgdir/usr/lib/$pkgname/REW.desktop" "$pkgdir/usr/share/applications/$pkgname/$pkgname.desktop"

  # repair
  sed "s%$pkgdir%%g" -i "$pkgdir/usr/lib/$pkgname/.install4j/response.varfile"
  sed "s%$pkgdir%%g" -i "$pkgdir/usr/lib/$pkgname/.install4j/install.prop"

  sed "s%$pkgdir%%g" -i "$pkgdir/usr/share/applications/$pkgname/$pkgname.desktop"
  sed "s/REW/Room EQ Wizard - Beta/g" -i "$pkgdir/usr/share/applications/$pkgname/$pkgname.desktop"

  # basic cleanup
  rm -rf "$pkgdir/usr/lib/$pkgname/.install4j/files.log"
  rm -rf "$pkgdir/usr/lib/$pkgname/.install4j/installation.log"
  rm -rf "$pkgdir/usr/lib/$pkgname/.install4j/uninstall.png"
  rm -rf "$pkgdir/usr/lib/$pkgname/uninstall"
}
