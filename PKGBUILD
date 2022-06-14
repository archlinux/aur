# Maintainer: taotieren <admin@taotieren.com>
# Co-Maintainer: Leon Möller <jkhsjdhjs at totally dot rip>

pkgname=rustdesk-bin
pkgver=1.1.9
pkgrel=2
pkgdesc="Yet another remote desktop software, written in Rust. Works out of the box, no configuration required. Great alternative to TeamViewer and AnyDesk!"
arch=('x86_64')
url="https://github.com/rustdesk/rustdesk"
license=('GPL3')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
# TODO: add dep on libsciter-gtk, remove libsciter-gtk.so from this package
depends=('gtk3' 'xdotool' 'libxcb' 'libxfixes' 'alsa-lib' 'pulseaudio' 'hicolor-icon-theme' 'xdg-utils' 'python-pynput')
options=('!strip')
source=("$url/releases/download/${pkgver}/rustdesk-${pkgver}-manjaro-arch.pkg.tar.zst")
sha256sums=('SKIP')

prepare() {
    sed -i "s/^\(Icon=\).*$/\1rustdesk/" "$srcdir/usr/share/rustdesk/files/rustdesk.desktop"
}

package() {
    install -Dm755 "$srcdir/usr/bin/rustdesk" "$pkgdir/usr/bin/rustdesk"
    install -Dm755 "$srcdir/usr/lib/rustdesk/libsciter-gtk.so" "$pkgdir/usr/lib/rustdesk/libsciter-gtk.so"
    install -Dm644 "$srcdir/usr/share/rustdesk/files/pynput_service.py" "$pkgdir/usr/share/rustdesk/files/pynput_service.py"
    install -Dm644 "$srcdir/usr/share/rustdesk/files/rustdesk.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/rustdesk.png"
    install -Dm644 "$srcdir/usr/share/rustdesk/files/rustdesk.desktop" "$pkgdir/usr/share/applications/rustdesk.desktop"
    install -Dm644 "$srcdir/usr/share/rustdesk/files/rustdesk.service" "$pkgdir/usr/lib/systemd/system/rustdesk.service"
}
