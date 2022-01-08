# Maintainer: taotieren <admin@taotieren.com>
# Co-Maintainer: Leon Möller <jkhsjdhjs at totally dot rip>

pkgname=rustdesk-bin
pkgver=1.1.8
pkgrel=3
pkgdesc="Yet another remote desktop software, written in Rust. Works out of the box, no configuration required. Great alternative to TeamViewer and AnyDesk!"
arch=('x86_64')
url="https://github.com/rustdesk/rustdesk"
license=('GPL3')
provides=("${pkgname%-bin}")
conflicts=("${pkgname}" "${pkgname%-bin}" "${pkgname/bin/git}")
# TODO: add dep on libsciter-gtk, remove libsciter-gtk.so from this package
depends=('gtk3' 'xdotool' 'libxcb' 'libxfixes' 'alsa-lib' 'pulseaudio')
options=('!strip')
source=("$url/releases/download/${pkgver}/rustdesk-${pkgver}-manjaro-arch.pkg.tar.zst")
sha256sums=('8fe8f3179ebdc8660ffdf70c39386894dc25780183101ef464d99fc97eb881d3')

prepare() {
    sed -i "s/^\(Icon=\).*$/\1rustdesk/" "$srcdir/usr/share/rustdesk/files/rustdesk.desktop"
}

package() {
    install -Dm755 "$srcdir/usr/bin/rustdesk" "$pkgdir/usr/bin/rustdesk"
    install -Dm755 "$srcdir/usr/lib/rustdesk/libsciter-gtk.so" "$pkgdir/usr/lib/rustdesk/libsciter-gtk.so"
    install -Dm644 "$srcdir/usr/share/rustdesk/files/rustdesk.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/rustdesk.png"
    install -Dm644 "$srcdir/usr/share/rustdesk/files/rustdesk.desktop" "$pkgdir/usr/share/applications/rustdesk.desktop"
    install -Dm644 "$srcdir/usr/share/rustdesk/files/rustdesk.service" "$pkgdir/usr/lib/systemd/system/rustdesk.service"
}
