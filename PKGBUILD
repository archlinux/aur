# Maintainer: Stephen Bell <theredbaron1834 @ yahoo.com>
# Contributor: 1ace
pkgname=destinationsol
pkgrel=2
pkgver=2.0.0
pkgdesc="2D Space Arcade/RPG with Planets"
arch=('i686' 'x86_64')
url="https://github.com/MovingBlocks/DestinationSol"
license=('Apache V2')
depends=('java-runtime-common')
makedepends=('icoutils')
source=("$url/releases/download/v$pkgver/DestinationSol.zip")
sha1sums=('4d704a882eed7dec9f520d8ec5893985c91809bd')

build() {
  wrestool -x -t 14 sol.exe > icon.ico
  rm -rf lwjre lwjreOSX
  rm -f sol.exe sol*.sh
  rm DestinationSol.zip
}

package() {
  install -m777 -d "$pkgdir/opt/DestinationSol"
  mv * "$pkgdir/opt/DestinationSol/"

  mkdir -p "$pkgdir/usr/share/applications/"
  mkdir -p "$pkgdir/usr/bin/"
  echo "[Desktop Entry]
Name=Destination Sol
GenericName=Destination Sol
Comment=2D Space Arcade/RPG with Planets
Exec=DestinationSol
Icon=/opt/DestinationSol/icon.ico
Terminal=false
Type=Application
Categories=Game;" > "$pkgdir/usr/share/applications/DestinationSol.desktop"
  echo "cd /opt/DestinationSol/
java -jar /opt/DestinationSol/libs/solDesktop.jar" > "$pkgdir/usr/bin/DestinationSol"
  chmod +x "$pkgdir/usr/bin/DestinationSol"
}

