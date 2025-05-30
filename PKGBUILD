# Maintainer: David Gro <gro.david.d@gmail.com>
pkgname=digital-logic-sim-bin
pkgrel=1
pkgver="v2.1.6"
pkgdesc="The logic simulation used and developed by Sebastian Lague."
arch=('x86_64')
url="https://github.com/SebLague/Digital-Logic-Sim"
license=("MIT")
makedepends=("unzip")
source=("dls.zip::https://cdn.matix-media.net/dd/427fcef6" "dls.desktop" "dls-icon.jpg")
sha256sums=('SKIP'
  'a347d30340f3b38cafa156745efef18e768794f73252c8585b2021b4b47b8535'
  'be3af17e3a63ab19f9526da768e7cdb22242199ea5983593de300e88ba5d202d')

DLAGENTS=("https::/usr/bin/wget --content-disposition -O %o %u")

prepare() {
  cd "$srcdir"

  # Unzip the zip file
  unzip "$srcdir/dls.zip" -d "$srcdir/Digital-Logic-Sim"
}

package() {
  cd "$srcdir/Digital-Logic-Sim"

  # Install the app to /opt
  install -d "$pkgdir/opt/dls"
  cp -r Digital-Logic-Sim/* "$pkgdir/opt/dls/"
  sudo chmod +x "$pkgdir/opt/dls/Digital-Logic-Sim.x86_64"

  # Create a launcher script in /usr/bin
  install -d "$pkgdir/usr/bin"
  cat >"$pkgdir/usr/bin/dls" <<EOF
#!/bin/bash
exec /opt/dls/Digital-Logic-Sim.x86_64 "\$@"
EOF
  chmod +x "$pkgdir/usr/bin/dls"

  # Install the .desktop file
  install -Dm644 "$srcdir/dls.desktop" "$pkgdir/usr/share/applications/dls.desktop"

  # Install the icon
  install -Dm644 "$srcdir/dls-icon.jpg" "$pkgdir/usr/share/pixmaps/dls-icon.jpg"
}
