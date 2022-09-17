# Maintainer: 0b100100 <0b100100 at protonmail dot ch>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: William Grieshaber <me@zee.li>
# Contributor: Chris Giles <Chris.G.27 (at) Gmail.com>
# Contributor: Nathan Owe <ndowens.aur at gmail dot com>

pkgname=alice-bin
pkgver=3.7.0.0
_build=876
pkgrel=1
pkgdesc="An educational software that teaches students computer programming in a 3D environment"
arch=('i686' 'x86_64')
url="https://www.alice.org"
license=('custom')
depends=('java-runtime=17'
         'xdg-utils'
         'lib32-glu'
         'lib32-libxrandr'
         'lib32-libxcursor'
         'lib32-libxi')
options=('!strip')
provides=('alice3')
source=("$pkgname-$pkgver.sh::https://github.com/TheAliceProject/alice3/releases/download/$pkgver/alice3_unix_installer_${pkgver//./_}+build_$_build.sh")
noextract=("$pkgname-$pkgver.sh")
sha512sums=('e534a67ff98ab64dd6e425ea8704d613bf7a6aa7e5bc4f66906afdcaf1153c953fb9e1780a9872004bbe62e1a2db59db71015717b7709d7ee6c5a08c2f2f93fa')

package() {
  install -d "$pkgdir/opt" "$pkgdir/usr/share/applications"
  chmod 755 $pkgname-$pkgver.sh
  ./$pkgname-$pkgver.sh -q -dir "$pkgdir/opt/alice"
  unlink "$pkgdir/opt/alice/Alice 3.desktop"
  mv "$pkgdir/opt/alice/.install4j/install4j_kw8cjn-Alice_3.desktop" "$pkgdir/usr/share/applications/Alice 3.desktop"
  rm "$pkgdir/opt/alice/uninstall"
  sed -i "s@$pkgdir@@" "$pkgdir/usr/share/applications/Alice 3.desktop"
  sed -i "6s@.*@Icon=Alice 3@" "$pkgdir/usr/share/applications/Alice 3.desktop"
  sed -i "7s@.*@Categories=Development;IDE;@" "$pkgdir/usr/share/applications/Alice 3.desktop"
  sed -i "6 a GenericName=Tile Based 3D Development Environment" "$pkgdir/usr/share/applications/Alice 3.desktop"
  sed -i "7 a Comment=Build and program 3D worlds" "$pkgdir/usr/share/applications/Alice 3.desktop"
  sed -i "8 a Terminal=false" "$pkgdir/usr/share/applications/Alice 3.desktop"
  sed -i "s|$srcdir||" "$pkgdir/opt/alice/.install4j/installation.log"
  sed -i "s|$pkgdir||" "$pkgdir/opt/alice/.install4j/response.varfile"
  sed -i "s|$pkgdir||" "$pkgdir/opt/alice/.install4j/installation.log"
  sed -i "s|$pkgdir||" "$pkgdir/opt/alice/.install4j/install.prop"
  install -Dm644 "$pkgdir/opt/alice/.install4j/Alice 3.png" "$pkgdir/usr/share/pixmaps/Alice 3.png"
  install -Dm644 "$pkgdir/opt/alice/application/EULA_Alice3.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
