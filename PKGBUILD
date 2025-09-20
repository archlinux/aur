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
    # Create directories
    install -d "$pkgdir/usr/bin"
    install -d "$pkgdir/usr/share/pnmixer"
    install -d "$pkgdir/usr/share/applications"
    install -d "$pkgdir/usr/share/icons/hicolor/128x128/apps"
    install -d "$pkgdir/usr/share/locale"
    install -d "$pkgdir/usr/share/man/man1"

    # Copy the binary into /usr/share/pnmixer
    install -Dm755 "$srcdir/usr/bin/pnmixer" "$pkgdir/usr/share/pnmixer/pnmixer"

    # Copy UI folder
    cp -r "$srcdir/usr/share/pnmixer/ui" "$pkgdir/usr/share/pnmixer/"

    # Copy pixmaps/icons
    cp -r "$srcdir/usr/share/pnmixer/pixmaps" "$pkgdir/usr/share/pnmixer/"

    # Copy .desktop file
    cp "$srcdir/usr/share/applications/pnmixer.desktop" "$pkgdir/usr/share/applications/"

    # Copy icons
    cp "$srcdir/usr/share/icons/hicolor/128x128/apps/pnmixer.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/"

    # Copy locales
    cp -r "$srcdir/usr/share/locale" "$pkgdir/usr/share/"

    # Copy man page
    cp "$srcdir/usr/share/man/man1/pnmixer.1.gz" "$pkgdir/usr/share/man/man1/"

    # Create symlink in /usr/bin for normal users
    ln -s /usr/share/pnmixer/pnmixer "$pkgdir/usr/bin/pnmixer"
}
