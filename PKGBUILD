# Maintainer: Aydin Rahbaran <codewizaard@proton.me>
pkgname=basteh
pkgver=0.0.4
pkgrel=3
pkgdesc="GTK GUI frontend for pacman"
arch=('x86_64')
url="https://github.com/sahandlinux/basteh"
license=('GPL3')
depends=('gtk3' 'pacman' 'polkit')
makedepends=('gcc' 'git')
source=("main.c")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname/Basteh"
  gcc main.c -o basteh $(pkg-config --cflags --libs gtk+-3.0)
}

package() {
  # Binary
  install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/basteh"

  # Icon
  install -Dm644 "$srcdir/$pkgname/basteh_minimal.jpg" "$pkgdir/usr/share/icons/basteh_minimal.jpg"

  # Desktop Entry
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/basteh.desktop" <<EOF
[Desktop Entry]
Version=0.0.2
Name=Basteh
Exec=$pkgdir/usr/bin/basteh
Icon=$pkgdir/usr/share/icons/basteh_minimal.jpg
Terminal=false
Type=Application
Categories=System;Utility;
EOF
}

sha256sums=('669b4f77c5adcc7ab9ea5be031917fe04419d12ae52b02acb41f477e0e097ed9')
