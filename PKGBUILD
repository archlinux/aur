# Maintainer: Manuel Mazzuola <origin.of@gmail.com>
pkgname=turtl
pkgver=0.6.2
pkgrel=1
pkgdesc="Turtl lets you take notes, bookmark websites, and store documents for sensitive projects."
arch=('i686' 'x86_64')
url="https://turtl.it"
depends=('gendesk')
license=('GPL3')
source=("https://turtl.it/releases/desktop/$pkgname-linux32-$pkgver.tar.bz2"
        "https://turtl.it/releases/desktop/$pkgname-linux64-$pkgver.tar.bz2"
        "turtl.png")
md5sums=("2612da7a8664bb758b3742be5f7183ac"
        "224d568533ddf37b7759b8c1bf39cf01"
        "9e99b3fe83cb796343b7f1b21959f0d7")

[[ "$CARCH" = "i686" ]] && _pkg="turtl-linux32"
[[ "$CARCH" = "x86_64" ]] && _pkg="turtl-linux64"

package() {
  cd "${_pkg}"
	./install.sh ${pkgdir}$HOME/.turtl > /dev/null
  chown -R $USER ${pkgdir}$HOME/.turtl
  gendesk -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" --exec "$HOME/.turtl/turtl" -f
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 ../"$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
