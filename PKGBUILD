# Maintainer: Callum Parsey <neoninteger@protonmail.com>
# Contributor: Manuel Mazzuola <origin.of@gmail.com>
# Contributor: gaalcaras (https://keybase.io/gaalcaras)
pkgname=turtl
pkgver=0.7.2.6
_pkgstring=0.7.2.6-pre-sync-fix
pkgrel=1
pkgdesc="The secure, collaborative notebook"
arch=('i686' 'x86_64')
url="https://turtlapp.com/"
depends=('alsa-lib' 'gconf' 'gtk2' 'libxss' 'libxtst' 'nss' 'python')
makedepends=('gendesk')
license=('GPL3')
source=("turtl.png")
source_i686=("https://github.com/turtl/desktop/releases/download/v$_pkgstring/$pkgname-$_pkgstring-linux32.tar.bz2")
source_x86_64=("https://github.com/turtl/desktop/releases/download/v$_pkgstring/$pkgname-$_pkgstring-linux64.tar.bz2")
sha256sums=('97036fdfca0e354363bc28f1952af6e63b85907a8292d2f121905130cee23e07')
sha256sums_i686=('3644e521b8ce763cd58fb2394445f17706296b8aa594564d50b1d5b5126bff40')
sha256sums_x86_64=('77746d54518aabf19c187c6fb3c9923fe84acad30a68073fee50ba5f61a96bde')
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
