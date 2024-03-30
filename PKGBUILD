# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=niri-bin
pkgver=0.1.4
pkgrel=1
_buildid=07236490
pkgdesc="Scrollable-tiling Wayland compositor"
arch=(aarch64 x86_64)
url="https://github.com/YaLTeR/${pkgname%-bin}"
_buildurl="https://download.copr.fedorainfracloud.org/results/yalter"
license=(GPL-3.0-or-later)
depends=(cairo gcc-libs glib2 glibc libinput libpipewire libxkbcommon mesa pango pixman seatd systemd-libs)
optdepends=('fuzzel: application launcher similar to rofi drun mode'
            'waybar: highly customizable Wayland bar'
            'alacritty: a cross-platform OpenGL terminal emulator'
            'mako: notification daemon for Wayland'
            'swaybg: wallpaper tool for Wayland compositors'
            'swaylock: screen locker for Wayland'
            'xdg-desktop-portal-gtk: implements most of the basic functionality'
            'xdg-desktop-portal-gnome: screencasting support'
            'gnome-keyring: implements the secret portal, for certain apps to work'
            'polkit-gnome: when apps need to ask for root permissions'
            'meld: to synchronize config.kdl with new options from default-config.kdl')
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin})
options=(!debug)
install=${pkgname%-bin}.install
source_aarch64=(${pkgname%-bin}-$pkgver-aarch64.rpm::$_buildurl/${pkgname%-bin}/fedora-40-aarch64/$_buildid-${pkgname%-bin}/${pkgname%-bin}-$pkgver-$pkgrel.fc40.aarch64.rpm)
source_x86_64=(${pkgname%-bin}-$pkgver-x86_64.rpm::$_buildurl/${pkgname%-bin}/fedora-40-x86_64/$_buildid-${pkgname%-bin}/${pkgname%-bin}-$pkgver-$pkgrel.fc40.x86_64.rpm)
b2sums_aarch64=('d01f4c6278632b66f3e12a283f0f7f33bbd842778d35e7478f25e50166be7a644f27808757dcd8b84f35353128dcc61539d82eefbe6d852bdb24959eb026edfe')
b2sums_x86_64=('fee6a96bd741a26451a1d37d4e559113e6f76034f0f11545b2d205082720616cc95c7317da72902cb3299a3943b2f81287f986c4a303579de69bf6451e6a5a68')

package() {
    install -Dm755 usr/bin/${pkgname%-bin}{,-session}                              -t "$pkgdir"/usr/bin/
    install -Dm644 usr/lib/systemd/user/${pkgname%-bin}{.service,-shutdown.target} -t "$pkgdir"/usr/lib/systemd/user/
    install -Dm644 usr/share/doc/${pkgname%-bin}/{default-config.kdl,README.md}    -t "$pkgdir"/usr/share/doc/${pkgname%-bin}/
    install -Dm644 usr/share/wayland-sessions/${pkgname%-bin}.desktop              -t "$pkgdir"/usr/share/wayland-sessions/
    install -Dm644 usr/share/xdg-desktop-portal/${pkgname%-bin}-portals.conf       -t "$pkgdir"/usr/share/xdg-desktop-portal/
}
