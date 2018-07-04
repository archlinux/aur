# Maintainer: Stephen Bell <theredbaron1834 @ yahoo.com>
pkgname=destinationsol
pkgrel=2
pkgver=1.5.0
pkgdesc="2D Space Arcade/RPG with Planets"
arch=('i686' 'x86_64')
url="https://github.com/MovingBlocks/DestinationSol"
license=('Apache V2')
depends=('java-runtime-common')
makedepends=('unzip')

build() {
  mkdir "$srcdir/DestinationSol"
  cd "$srcdir"/DestinationSol
  msg "Grabbing files...."
  curl https://github.com/MovingBlocks/DestinationSol/releases/download/v1.5.0/DestinationSol1.5.0.zip -L -o DestinationSol.zip
  unzip DestinationSol.zip
}

package() {
  cd "$pkgdir"
install -m777 -d "$pkgdir/opt/DestinationSol"
  cp -r "$srcdir/DestinationSol/libs" "$pkgdir/opt/DestinationSol/"
  cp -r "$srcdir/DestinationSol/res" "$pkgdir/opt/DestinationSol/"
  mkdir -p "$pkgdir/usr/share/applications/"
  mkdir -p "$pkgdir/usr/bin/"
  echo "[Desktop Entry]
Name=Destination Sol
GenericName=Destination Sol
Comment=2D Space Arcade/RPG with Planets
Exec=DestinationSol
Icon=/opt/DestinationSol/res/icon.png
Terminal=false
Type=Application
Categories=Game;" > "$pkgdir/usr/share/applications/DestinationSol.desktop"
  echo "cd /opt/DestinationSol/
java -jar /opt/DestinationSol/libs/solDesktop.jar" > "$pkgdir/usr/bin/DestinationSol"
  chmod +x "$pkgdir/usr/bin/DestinationSol"
}

