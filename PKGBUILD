# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=niri-bin
pkgver=0.1.3
pkgrel=1
_buildid=07129488
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
source_aarch64=($_buildurl/${pkgname%-bin}/fedora-40-$CARCH/$_buildid-${pkgname%-bin}/${pkgname%-bin}-$pkgver-1.fc40.$CARCH.rpm)
source_x86_64=($_buildurl/${pkgname%-bin}/fedora-40-$CARCH/$_buildid-${pkgname%-bin}/${pkgname%-bin}-$pkgver-1.fc40.$CARCH.rpm)
b2sums_aarch64=('63eaca621539bd7d3aa8931f144189ed06ab2971bd89a99aff00a65bc5e29d1dd61ff6a9f96994d6295444180dc5dbd12905d111773f1c82fcfb2920f7f80f32')
b2sums_x86_64=('052cd5a7e51b56f82284a0109c5a244e62458474e3d3ea670e2f813873369683f8f0b462214195980305c46c9d5aa632f07e4c3354535f48f9414c88a2ffffa3')

package() {
    install -Dm755 usr/bin/${pkgname%-bin}{,-session}                              -t $pkgdir/usr/bin/
    install -Dm644 usr/lib/systemd/user/${pkgname%-bin}{.service,-shutdown.target} -t $pkgdir/usr/lib/systemd/user/
    install -Dm644 usr/share/doc/${pkgname%-bin}/{default-config.kdl,README.md}    -t $pkgdir/usr/share/doc/${pkgname%-bin}/
    install -Dm644 usr/share/wayland-sessions/${pkgname%-bin}.desktop              -t $pkgdir/usr/share/wayland-sessions/
    install -Dm644 usr/share/xdg-desktop-portal/${pkgname%-bin}-portals.conf       -t $pkgdir/usr/share/xdg-desktop-portal/
}
