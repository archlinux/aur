# Maintainer: Proshiv85 <proshiv85@example.com>
pkgname=realcopy
pkgver=1.0.0
pkgrel=1
pkgdesc="GTK4 file copy utility that actually writes to slow USB drives - no more kernel cache lies"
arch=('x86_64')
url="https://github.com/proshiv85-byte/realcopy"
license=('MIT')
depends=('gtk4')
makedepends=('gcc' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"
  gcc -O2 -o realcopy-gui main.c $(pkg-config --cflags --libs gtk4)
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 realcopy-gui "$pkgdir/usr/bin/realcopy-gui"

  mkdir -p "$pkgdir/usr/share/applications"
  cat > "$pkgdir/usr/share/applications/realcopy.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=RealCopy
Comment=Reliable file copy to slow USB drives
Exec=realcopy-gui
Terminal=false
Categories=Utility;FileTools;
EOF
}
