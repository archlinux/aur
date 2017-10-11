pkgname=roomeqwizard
pkgver=5.18
_pkgver=5_18
pkgrel=1
pkgdesc="A room acoustics analysis software for measuring and analysing room and loudspeaker responses"
arch=('any')
url="http://www.roomeqwizard.com"
license=('custom')
depends=('java-environment')
source=("https://www.roomeqwizard.com/installers/REW_linux_$_pkgver.sh")
sha512sums=('e256d2ad57bbed4c1e90380e1aa7247815f0ff91a4426a68caa200cf3f4af971515598c04a48f8657a8f4ada65bc8aa106469f46133f8a39a87f62e7e205af8b')

package() {
  sh REW_linux_$_pkgver.sh -q -dir "$pkgdir/opt/$pkgname"

  mkdir -p "$pkgdir/usr/bin" \
           "$pkgdir/usr/share/licenses/$pkgname" \
           "$pkgdir/usr/share/doc/$pkgname" \
           "$pkgdir/usr/share/applications/$pkgname"

  ln -s "$pkgdir/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
  mv "$pkgdir/opt/$pkgname/EULA.html" "$pkgdir/usr/share/licenses/$pkgname/"
  mv "$pkgdir/opt/$pkgname/readme.txt" "$pkgdir/usr/share/doc/$pkgname/"
  mv "$pkgdir/opt/$pkgname/REW.desktop" "$pkgdir/usr/share/applications/$pkgname/$pkgname.desktop"

  # repair
  sed "s%$pkgdir%%g" -i "$pkgdir/opt/$pkgname/.install4j/response.varfile"
  sed "s%$pkgdir%%g" -i "$pkgdir/opt/$pkgname/.install4j/install.prop"

  sed "s%$pkgdir%%g" -i "$pkgdir/usr/share/applications/$pkgname/$pkgname.desktop"
  sed "s/REW/Room EQ Wizard/g" -i "$pkgdir/usr/share/applications/$pkgname/$pkgname.desktop"

  # basic cleanup
  rm -rf "$pkgdir/opt/$pkgname/.install4j/files.log"
  rm -rf "$pkgdir/opt/$pkgname/.install4j/installation.log"
  rm -rf "$pkgdir/opt/$pkgname/.install4j/uninstall.png"
  rm -rf "$pkgdir/opt/$pkgname/uninstall"
}
