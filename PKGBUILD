# Maintainer: Jesse Limerick <iontunnel@proton.me>
pkgname=pnmixer-bin
pkgver=0.7.2
pkgrel=1
pkgdesc="A lightweight modular system tray volume mixer for ALSA/Pulseaudio/Pipewire (binary)"
arch=('x86_64')
url="https://github.com/nicklan/pnmixer"
license=('GPL')
depends=('alsa-utils' 'gtk3' 'libnotify')
provides=('pnmixer')
conflicts=('pnmixer')
source=("pnmixer-bin-0.7.2.tar.gz")
sha256sums=('SKIP')

package() {
  # Copy all shared files
  cp -r "$srcdir/pnmixer-bin/usr/share/pnmixer" "$pkgdir/usr/share/"

  # Copy the .desktop, icons, locales, man page
  cp -r "$srcdir/pnmixer-bin/usr/share/applications" "$pkgdir/usr/share/"
  cp -r "$srcdir/pnmixer-bin/usr/share/icons" "$pkgdir/usr/share/"
  cp -r "$srcdir/pnmixer-bin/usr/share/locale" "$pkgdir/usr/share/"
  cp -r "$srcdir/pnmixer-bin/usr/share/man" "$pkgdir/usr/share/"

  # Install a small wrapper script in /usr/bin
  install -Dm755 "$srcdir/pnmixer-bin/usr/bin/pnmixer" "$pkgdir/usr/share/pnmixer/pnmixer"
  cat << 'EOF' > "$pkgdir/usr/bin/pnmixer"
#!/bin/bash
# Start pnmixer from its data folder so it finds the UI files
exec /usr/share/pnmixer/pnmixer "$@"
EOF
}
