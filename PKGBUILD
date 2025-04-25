pkgname=hobuild-gui
pkgver=1.0
pkgrel=1
pkgdesc="Simple GUI for creating build.hob files"
arch=('x86_64')
url="https://github.com/wholos/hobuild-gui"
license=('GPL3')
depends=('nana' 'libx11' 'libxft' 'libxcursor')
makedepends=('gcc' 'git')
source=("https://github.com/wholos/hobuild-gui/archive/refs/heads/main.zip")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  
  cat > hobuild-gui.desktop <<EOF
[Desktop Entry]
Name=Hobuild GUI
Comment=Create build.hob files
Exec=/usr/bin/hobuild-gui
Icon=gedit
Terminal=false
Type=Application
Categories=Development;
EOF
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  g++ main.cpp -o hobuild-gui -std=c++17 -lnana -lX11 -lXft -lXcursor
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  
  install -Dm755 hobuild-gui "$pkgdir/usr/bin/hobuild-gui"
  
  install -Dm644 hobuild-gui.desktop "$pkgdir/usr/share/applications/hobuild-gui.desktop"
  
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
