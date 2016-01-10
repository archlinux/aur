# Maintainer: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)
pkgname=roomeqwizard
pkgver=5.14
_pkgver=5_14
pkgrel=1
pkgdesc="free room acoustics analysis software for measuring and analysing room and loudspeaker responses"
arch=('any')
url="http://www.roomeqwizard.com"
license=('custom')
depends=('java-environment' 'xdg-utils')
source=("http://www.roomeqwizard.com/installers/REW_linux_$_pkgver.sh")
md5sums=('8432c31df1cdf5042df022bb4e9c7a8b')

package() {
  # install
  mkdir -p "$pkgdir/opt/REW" "$pkgdir/usr/bin" "$pkgdir/usr/share/licenses/$pkgname" "$pkgdir/usr/share/doc/$pkgname" "$pkgdir/usr/share/applications/$pkgname"
  sh REW_linux_$_pkgver.sh -q -dir "$pkgdir/opt/REW"
  mv "$pkgdir/opt/REW/EULA.html" "$pkgdir/usr/share/licenses/$pkgname/EULA.html"
  mv "$pkgdir/opt/REW/readme.txt" "$pkgdir/usr/share/doc/$pkgname/readme"
  mv "$pkgdir/opt/REW/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname/$pkgname.desktop"
  ln -s "/opt/REW/$pkgname" "$pkgdir/usr/bin/$pkgname"

  # basic cleanup
  rm -rf "$pkgdir/opt/REW/.install4j/installation.log"
  rm -rf "$pkgdir/opt/REW/uninstall"
  rm -rf "$pkgdir/opt/REW/uninstall.png"

  # repair
  sed "s#$pkgdir##g" -i "$pkgdir/usr/share/applications/$pkgname/$pkgname.desktop"
  sed "s#$pkgdir##g" -i "$pkgdir/opt/REW/.install4j/response.varfile"
  sed "s#$pkgdir##g" -i "$pkgdir/opt/REW/.install4j/install.prop"
}

# vim:set ts=2 sw=2 et:
