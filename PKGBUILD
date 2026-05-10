# Maintainer: Michał Lasak <mlasak@spacecoffee.net>
pkgname=spacecoffee-scm
pkgver=0.2.0
pkgrel=1
pkgdesc="SpaceCoffee's vehicles maintainence app"
arch=('x86_64')
url="https://gitlab.com/space_coffee/scm/desktop"
license=('GPL')
depends=('qt6-base' 'qt6-serialport' 'qt6-svg')
makedepends=('git')

source=("${pkgname}::git+https://gitlab.com/space_coffee/scm/desktop.git")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  qmake6 maintenance.pro
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 sc_maintenance "$pkgdir/usr/bin/spacecoffee-scm"
  mkdir -p "$pkgdir/usr/share/applications"
  cat <<EOF > "$pkgdir/usr/share/applications/spacecoffee-scm.desktop"
[Desktop Entry]
Name=SCM
Exec=spacecoffee-scm
Terminal=false
Type=Application
Icon=utilities-terminal
Categories=Utility;Development;
Comment=Vehicles maintenance application
EOF
}
