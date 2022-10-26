# Maintainer: taotieren <admin@taotieren.com>

pkgname=rustdesk-nightly
pkgver=1.2.0
pkgrel=0
pkgdesc="Yet another remote desktop software, written in Rust. Works out of the box, no configuration required. Great alternative to TeamViewer and AnyDesk!"
arch=('x86_64')
url="https://github.com/rustdesk/rustdesk"
license=('GPL3')
provides=("${pkgname%-nightly}")
conflicts=("${pkgname%-nightly}")
# TODO: add dep on libsciter-gtk, remove libsciter-gtk.so from this package
depends=('gtk3' 'xdotool' 'libxcb' 'libxfixes' 'alsa-lib' 'pulseaudio' 'hicolor-icon-theme' 'xdg-utils' 'python-pynput' 'libayatana-appindicator')
options=('!strip')
source=("$url/releases/download/nightly/rustdesk-${pkgver}-${pkgrel}-${arch}.pkg.tar.zst")
sha256sums=('SKIP')

package() {
    mv -v "${srcdir}/usr" "${pkgdir}"
    install -Dm0644 "$pkgdir/usr/share/${pkgname%-nightly}/files/${pkgname%-nightly}.service" "$pkgdir/usr/lib/systemd/system/${pkgname%-nightly}.service"
    install -Dm0644 "$pkgdir/usr/share/${pkgname%-nightly}/files/${pkgname%-nightly}.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/${pkgname%-nightly}.png"
    install -Dm0644 "$pkgdir/usr/share/${pkgname%-nightly}/files/${pkgname%-nightly}.desktop" "$pkgdir/usr/share/applications/${pkgname%-nightly}.desktop"
    rm -rf "$pkgdir/usr/share/${pkgname%-nightly}/files/${pkgname%-nightly}.service"
    rm -rf "$pkgdir/usr/share/${pkgname%-nightly}/files/${pkgname%-nightly}.desktop"
    rm -rf "$pkgdir/usr/share/${pkgname%-nightly}/files/${pkgname%-nightly}.png"
}
