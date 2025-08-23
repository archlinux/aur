# Maintainer: NourEddine Yassine <NourEddineX at protonmail dot com>
# Contributor: Callum Parsey <neoninteger@protonmail.com>
# Contributor: Manuel Mazzuola <origin.of@gmail.com>
# Contributor: gaalcaras (https://keybase.io/gaalcaras)
pkgname=turtl
pkgver=0.7.3
_pkgstring=0.7.3
pkgrel=1
pkgdesc="The secure, collaborative notebook"
arch=('x86_64')
url="https://turtlapp.com/"
depends=('alsa-lib' 'gtk2' 'libxss' 'libxtst' 'nss' 'python' 'openssl-1.0')
makedepends=('gendesk')
license=('GPL3')
source=("turtl.png")
source_x86_64=("https://github.com/turtl/desktop/releases/download/v$_pkgstring/$pkgname-$_pkgstring-linux64.tar.bz2")
sha256sums=('97036fdfca0e354363bc28f1952af6e63b85907a8292d2f121905130cee23e07')
sha256sums_x86_64=('831cfd68d3ffb60d788e3baa6067a3b8e3c96e49b2ab26ead0eb5486877da996')
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
