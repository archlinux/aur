# Maintainer: Stephen Bell <theredbaron1834 @ yahoo.com>
pkgname=destinationsol
pkgrel=2
pkgver=2.0.0beta
pkgdesc="2D Space Arcade/RPG with Planets"
arch=('i686' 'x86_64')
url="https://github.com/MovingBlocks/DestinationSol"
license=('Apache V2')
depends=('java-runtime-common')
makedepends=('unzip' 'icoutils')

build() {
  mkdir "$srcdir/DestinationSol"
  cd "$srcdir"/DestinationSol
  msg "Grabbing files...."
  curl https://github.com/MovingBlocks/DestinationSol/releases/download/v2.0.0-beta/DestinationSol.zip -L -o DestinationSol.zip
  unzip DestinationSol.zip
  wrestool -x -t 14 "$srcdir/DestinationSol/sol.exe" > "$srcdir/DestinationSol/icon.ico"
}

package() {
  cd "$pkgdir"
install -m777 -d "$pkgdir/opt/DestinationSol"
  cp -r "$srcdir/DestinationSol/" "$pkgdir/opt/"

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

