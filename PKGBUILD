# Maintainer: Aydin Rahbaran <codewizaard@proton.me>
pkgname=basteh
pkgver=0.0.2
pkgrel=1
pkgdesc="GTK GUI frontend for pacman"
arch=('x86_64')
url="https://github.com/sahandlinux/basteh"
license=('GPL3')
depends=('gtk3' 'pacman' 'polkit')
makedepends=('gcc' 'git')
source=("$pkgname::git+https://github.com/sahandlinux/basteh.git")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname/Basteh"
  gcc main.c -o basteh `pkg-config --cflags --libs gtk+-3.0`
}

package() {
  cd "$srcdir/$pkgname"

  # Install binary
  install -Dm755 "Basteh/basteh" "$pkgdir/usr/bin/basteh"

  # Install icon (rename to .png)
  install -Dm644 "icons/basteh_minimal.jpg" "$pkgdir/usr/share/icons/hicolor/128x128/apps/basteh.png"

  # Install .desktop file
  install -Dm644 /dev/null "$pkgdir/usr/share/applications/basteh.desktop"
  cat > "$pkgdir/usr/share/applications/basteh.desktop" <<EOF
[Desktop Entry]
Version=1.0
Name=Basteh
Exec=basteh
Icon=basteh
Terminal=false
Type=Application
Categories=System;Utility;
EOF
}

