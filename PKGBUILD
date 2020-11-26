# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: William Grieshaber <me@zee.li>
# Contributor: Chris Giles <Chris.G.27 (at) Gmail.com>
# Contributor: Nathan Owe <ndowens.aur at gmail dot com>

pkgname=alice-bin
pkgver=3.6.0.1
pkgrel=1
pkgdesc='An educational software that teaches students computer programming in a 3D environment'
arch=('i686' 'x86_64')
url="http://www.alice.org"
license=('custom')
depends=('java-environment=8'
         'xdg-utils'
         'lib32-glu'
         'lib32-libxrandr'
         'lib32-libxcursor')
options=('!strip')
provides=('alice3')
install=alice-bin.install
source=("${pkgname}-${pkgver}.sh::http://www.alice.org/wp-content/uploads/2020/10/Alice3_unix_installer_3_6_0_1.sh")
noextract=("${pkgname}-${pkgver}.sh")
sha256sums=('b2956ad4bc1731a6aa73470199310629851a1d806b7f8f0c2156a545ea5e2b34')

package() {
  install -d "${pkgdir}/opt" "${pkgdir}/usr/share/applications"
  chmod 755 ${pkgname}-${pkgver}.sh
  ./${pkgname}-${pkgver}.sh -q -dir "$pkgdir/opt/alice"
  mv "$pkgdir/opt/alice/Alice 3.desktop" "${pkgdir}/usr/share/applications/alice3.desktop"
  rm "$pkgdir/opt/alice/uninstall"
  sed -i "s@${pkgdir}@@" "${pkgdir}/usr/share/applications/alice3.desktop"
  sed -i "6s@.*@Icon=alice3@" "${pkgdir}/usr/share/applications/alice3.desktop"
  sed -i "7s@.*@Categories=Application;Development;@" "${pkgdir}/usr/share/applications/alice3.desktop"
  sed -i "3 a Comment=An IDE for teaching kids programming" "${pkgdir}/usr/share/applications/alice3.desktop"
  sed -i "s|$srcdir||" "${pkgdir}/opt/alice/.install4j/installation.log"
  sed -i "s|$pkgdir||" "${pkgdir}/opt/alice/.install4j/response.varfile"
  sed -i "s|$pkgdir||" "${pkgdir}/opt/alice/.install4j/installation.log"
  sed -i "s|$pkgdir||" "${pkgdir}/opt/alice/.install4j/install.prop"
  install -Dm644 "${pkgdir}/opt/alice/.install4j/Alice 3.png" "${pkgdir}/usr/share/pixmaps/alice3.png"
  install -Dm644 "${pkgdir}/opt/alice/application/EULA_Alice3.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=2 sw=2 et:
