# Maintainer: Manuel Mazzuola <origin.of@gmail.com>
# This particular update is brought to you by gaalcaras (https://keybase.io/gaalcaras)
pkgname=turtl
pkgver=0.6.4
pkgrel=3
pkgdesc="Turtl lets you take notes, bookmark websites, and store documents for sensitive projects."
arch=('i686' 'x86_64')
url="https://turtlapp.com/"
depends=('gconf' 'gendesk' 'libxss')
license=('GPL3')
source=("turtl.png")
source_i686=("https://turtl.it/releases/desktop/$pkgname-linux32-$pkgver.tar.bz2")
source_x86_64=("https://turtl.it/releases/desktop/$pkgname-linux64-$pkgver.tar.bz2")
md5sums=('9e99b3fe83cb796343b7f1b21959f0d7')
md5sums_i686=('6fe7cecf3804e3280afbb641c392d0ce')
md5sums_x86_64=('f7758c9d54b2e62ea9009f126652e357')

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
  chmod +r -R "${pkgdir}/opt/turtl/"
  chmod +rx "${pkgdir}/opt/turtl/turtl" "${pkgdir}/opt/turtl/turtl-bin" \
    "${pkgdir}/opt/turtl/chromedriver" \
    "${pkgdir}/opt/turtl/nwjc" ${pkgdir}/opt/turtl/nacl* \
    "${pkgdir}/opt/turtl/payload" "${pkgdir}/opt/turtl/lib" \
    "${pkgdir}/opt/turtl/locales" "${pkgdir}/opt/turtl/pnacl"
}
