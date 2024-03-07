# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=redshiftqt-git
pkgver=r36.0c9d79b
pkgrel=1
pkgdesc="Frontend for redshift written in Qt (latest commit)"
url="https://github.com/loathingKernel/RedShiftQt"
license=('GPL-3.0-or-later')
arch=('x86_64')
depends=('qt5-base' 'redshift')
makedepends=('git')
conflicts=("redshiftqt")
provides=("redshiftqt")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd RedShiftQt
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
# Create a shortcut
  echo -e "[Desktop Entry]\n\
Name=RedShiftQt\n\
Exec=redshiftqt\n\
Icon=redshift\n\
Terminal=false\n\
Type=Application\n\
Categories=Utility;\n\
Keywords=redshift;filter;eyes" > redshiftqt.desktop
}

build() {
  cd RedShiftQt
  export CARGO_HOME="$srcdir/CARGO_HOME"
  qmake redshiftqt/RedShiftQt.pro
  make
}

package() {
  install -Dm644 redshiftqt.desktop -t "$pkgdir/usr/share/applications"
  cd RedShiftQt
  install -Dm755 RedShiftQt "$pkgdir/usr/bin/redshiftqt"
}
