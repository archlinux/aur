# Maintainer: kunkka19xx <nobita079x@gmail.com>
pkgname=look-bin
pkgver=0.7.3
pkgrel=1
pkgdesc="Keyboard-first, local-first launcher for apps, files, clipboard, and quick commands"
arch=('x86_64')
url="https://github.com/kunkka19xx/look"
license=('GPL-3.0-or-later')
depends=('libxkbcommon' 'libxkbcommon-x11' 'libxcb' 'alsa-lib' 'dbus' 'vulkan-icd-loader' 'xdg-desktop-portal')
makedepends=('binutils' 'tar')
optdepends=(
    'vulkan-driver: GPU rendering; the GL fallback runs without it'
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
sha256sums=('4720f238b62a3a31a0b18711c1ba3157d334da6516a3f81dfd54972df23f6fa3')
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
