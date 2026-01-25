pkgname=drawy
pkgver=1.0.0
pkgrel=1
pkgdesc="A lightweight and user-friendly drawing application"
arch=('x86_64')
url="https://invent.kde.org/prayag/drawy"
license=('GPL')
depends=('kf6' 'qt6-base')
makedepends=('cmake' 'extra-cmake-modules' 'qt6-tools' 'git')
source=("git+https://invent.kde.org/prayag/drawy.git")
sha256sums=('SKIP')

build() {
  cd "$srcdir/drawy"
  cmake -B build -S . -DCMAKE_BUILD_TYPE=Release
  cmake --build build
}

package() {
  cd "$srcdir/drawy"
  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/usr/share/icons/hicolor/256x256/apps"
  install -dm755 "$pkgdir/usr/share/applications"
  install -Dm755 build/bin/drawy "$pkgdir/usr/bin/drawy"
  install -Dm644 assets/icon.ico "$pkgdir/usr/share/icons/hicolor/256x256/apps/drawy.ico"
  cat > "$pkgdir/usr/share/applications/drawy.desktop" <<EOF
[Desktop Entry]
Version=1.0
Name=Drawy
Comment=Lightweight drawing application
Exec=drawy
Icon=drawy
Terminal=false
Type=Application
Categories=Graphics;
EOF
}

