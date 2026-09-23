# Maintainer: kunkka19xx <nobita079x@gmail.com>
pkgname=look-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="Keyboard-first, local-first launcher for apps, files, clipboard, and quick commands"
arch=('x86_64')
url="https://github.com/kunkka19xx/look"
license=('GPL-3.0-or-later')
depends=('webkit2gtk-4.1' 'gtk3' 'librsvg' 'alsa-lib' 'dbus' 'xdg-desktop-portal')
makedepends=('binutils' 'tar')
optdepends=(
    'gtk-layer-shell: anchored window on Wayland compositors'
    'wl-clipboard: copy files to the clipboard on Wayland'
    'xclip: copy files to the clipboard on X11'
    'zenity: crash report dialog on GNOME'
    'kdialog: crash report dialog on KDE'
    'libnotify: crash report notification elsewhere'
)
provides=('lookapp')
conflicts=('lookapp' 'look')
options=(!strip !debug)
source=("$pkgname-$pkgver.deb::https://github.com/kunkka19xx/look/releases/download/v${pkgver}/Look_${pkgver}_amd64.deb")
sha256sums=('febbc1a21afd0bd47f93f5d749b49b534fcf01ca4f3766d026da917de9b53fff')
noextract=("$pkgname-$pkgver.deb")

package() {
    cd "$srcdir"
    ar x "$pkgname-$pkgver.deb"
    tar -xf data.tar.* -C "$pkgdir/"

    # Drop the Debian-specific copyright path into the Arch-standard licenses dir
    if [ -f "$pkgdir/usr/share/doc/lookapp/copyright" ]; then
        install -Dm644 "$pkgdir/usr/share/doc/lookapp/copyright" \
            "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}
