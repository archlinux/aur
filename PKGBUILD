# Maintainer: Manuel Mazzuola <origin.of@gmail.com>
# This particular update is brought to you by gaalcaras (https://keybase.io/gaalcaras)
pkgname=turtl
pkgver=0.7.2.5
pkgrel=1
pkgdesc="Turtl lets you take notes, bookmark websites, and store documents for sensitive projects."
arch=('i686' 'x86_64')
url="https://turtlapp.com/"
depends=('gconf' 'gendesk' 'libxss')
license=('GPL3')
source=("turtl.png")
source_i686=("https://github.com/turtl/desktop/releases/download/v$pkgver/$pkgname-$pkgver-linux32.tar.bz2")
source_x86_64=("https://github.com/turtl/desktop/releases/download/v$pkgver/$pkgname-$pkgver-linux64.tar.bz2")
md5sums=('9e99b3fe83cb796343b7f1b21959f0d7')
md5sums_i686=('e85d853dccadcb5a8f6a5478cd038690')
md5sums_x86_64=('771ac3060d5e6d13fcd1bb4644772999')
[[ "$CARCH" = "i686" ]] && _pkg="$pkgname-linux32"
[[ "$CARCH" = "x86_64" ]] && _pkg="$pkgname-linux64"

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
  chmod +r -R "${pkgdir}/opt/turtl/"
  chmod +rx "${pkgdir}/opt/turtl/turtl"
}
