# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=niri-bin
pkgver=0.1.3
pkgrel=2
_buildid=07131935
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
source_aarch64=($_buildurl/${pkgname%-bin}/fedora-40-aarch64/$_buildid-${pkgname%-bin}/${pkgname%-bin}-$pkgver-2.fc40.aarch64.rpm)
source_x86_64=($_buildurl/${pkgname%-bin}/fedora-40-x86_64/$_buildid-${pkgname%-bin}/${pkgname%-bin}-$pkgver-2.fc40.x86_64.rpm)
b2sums_aarch64=('1c0e40a1748a5232645088c4873c167ebb4443ae154f0c4b0658c3db75f3edbd6b4cfe9d2a66d04075a171601e0a8625b24c329278ab2b3795d8a2b6ba9fd747')
b2sums_x86_64=('606be9d590b3547e3e812141a99abbc2fa40abdd6ff8175bbf95fcfcc681c296f1ff5c4ad8bdad251dd425d8915409465855dab9d55b5b2a73b127c77760fd08')

package() {
    install -Dm755 usr/bin/${pkgname%-bin}{,-session}                              -t $pkgdir/usr/bin/
    install -Dm644 usr/lib/systemd/user/${pkgname%-bin}{.service,-shutdown.target} -t $pkgdir/usr/lib/systemd/user/
    install -Dm644 usr/share/doc/${pkgname%-bin}/{default-config.kdl,README.md}    -t $pkgdir/usr/share/doc/${pkgname%-bin}/
    install -Dm644 usr/share/wayland-sessions/${pkgname%-bin}.desktop              -t $pkgdir/usr/share/wayland-sessions/
    install -Dm644 usr/share/xdg-desktop-portal/${pkgname%-bin}-portals.conf       -t $pkgdir/usr/share/xdg-desktop-portal/
}
