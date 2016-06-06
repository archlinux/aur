# Maintainer: Manuel Mazzuola <origin.of@gmail.com>
pkgname=turtl
pkgver=0.6.3
pkgrel=2
pkgdesc="Turtl lets you take notes, bookmark websites, and store documents for sensitive projects."
arch=('i686' 'x86_64')
url="https://turtl.it"
depends=('gendesk')
license=('GPL3')
source=("turtl.png")
source_i686=("https://turtl.it/releases/desktop/$pkgname-linux32-$pkgver.tar.bz2")
source_x86_64=("https://turtl.it/releases/desktop/$pkgname-linux64-$pkgver.tar.bz2")
md5sums=('9e99b3fe83cb796343b7f1b21959f0d7')
md5sums_i686=('e29e3bb13d44c6d235bab31eb4db6343')
md5sums_x86_64=('4acf738c198b5e4a67188bc3aa968d59')

[[ "$CARCH" = "i686" ]] && _pkg="turtl-linux32"
[[ "$CARCH" = "x86_64" ]] && _pkg="turtl-linux64"

package() {
  cd "${_pkg}"
  mkdir -p ${pkgdir}/opt/turtl
  mkdir -p ${pkgdir}/usr/bin
  ./install.sh ${pkgdir}/opt/turtl > /dev/null
  rm -f "$HOME/.local/share/applications/turtl.desktop" > /dev/null
  gendesk -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" --exec "/opt/turtl/turtl" -f > /dev/null
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 ../"$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  ln -s "/opt/turtl/turtl" "${pkgdir}/usr/bin/turtl"
}
