# Maintainer: Daniel Desancic <arch at malfunc dot org>

pkgname=roomeqwizard-beta
pkgver=5.19_beta9
_pkgver=5_19_beta9
pkgrel=1
pkgdesc="A room acoustics analysis software for measuring and analysing room and loudspeaker responses. Beta version!"
arch=("any")
url="http://www.roomeqwizard.com"
license=("custom")
depends=("java-environment")
source=("https://malfunc.org/aur/REW_linux_$_pkgver.sh")
sha512sums=("8e15369d2009d87561975cd29c1c074ba00899623a5d3dbb042d8acbdcf34d7dfd7fb77ca5603e09f4099377fb025018e80635d7a53ab1b822c96cb1693f57a9")

package() {
  sh REW_linux_$_pkgver.sh -q -dir "$pkgdir/opt/$pkgname"

  mkdir -p "$pkgdir/usr/bin" \
           "$pkgdir/usr/share/licenses/$pkgname" \
           "$pkgdir/usr/share/doc/$pkgname" \
           "$pkgdir/usr/share/applications/$pkgname"

  ln -s "$pkgdir/opt/$pkgname/roomeqwizard" "$pkgdir/usr/bin/$pkgname"
  mv "$pkgdir/opt/$pkgname/REW.desktop" "$pkgdir/usr/share/applications/$pkgname/$pkgname.desktop"

  # repair
  sed "s%$pkgdir%%g" -i "$pkgdir/opt/$pkgname/.install4j/response.varfile"
  sed "s%$pkgdir%%g" -i "$pkgdir/opt/$pkgname/.install4j/install.prop"

  sed "s%$pkgdir%%g" -i "$pkgdir/usr/share/applications/$pkgname/$pkgname.desktop"
  sed "s/REW/Room EQ Wizard - Beta/g" -i "$pkgdir/usr/share/applications/$pkgname/$pkgname.desktop"

  # basic cleanup
  rm -rf "$pkgdir/opt/$pkgname/.install4j/files.log"
  rm -rf "$pkgdir/opt/$pkgname/.install4j/installation.log"
  rm -rf "$pkgdir/opt/$pkgname/.install4j/uninstall.png"
  rm -rf "$pkgdir/opt/$pkgname/uninstall"
}
