# Maintainer: Manuel Mazzuola <origin.of@gmail.com>
pkgname=turtl
pkgver=0.6.2
pkgrel=3
pkgdesc="Turtl lets you take notes, bookmark websites, and store documents for sensitive projects."
arch=('i686' 'x86_64')
url="https://turtl.it"
depends=('gendesk')
license=('GPL3')
source=("turtl.png")
source_i686=("https://turtl.it/releases/desktop/$pkgname-linux32-$pkgver.tar.bz2")
source_x86_64=("https://turtl.it/releases/desktop/$pkgname-linux64-$pkgver.tar.bz2")
md5sums=("9e99b3fe83cb796343b7f1b21959f0d7")
md5sums_i686=("2612da7a8664bb758b3742be5f7183ac")
md5sums_x86_64=("224d568533ddf37b7759b8c1bf39cf01")

[[ "$CARCH" = "i686" ]] && _pkg="turtl-linux32"
[[ "$CARCH" = "x86_64" ]] && _pkg="turtl-linux64"

package() {
  cd "${_pkg}"
  mkdir -p ${pkgdir}/opt/turtl
	./install.sh ${pkgdir}/opt/turtl > /dev/null
  rm -f "$HOME/.local/share/applications/turtl.desktop" > /dev/null
  gendesk -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" --exec "/opt/turtl/turtl" -f > /dev/null
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 ../"$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
