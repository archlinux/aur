pkgname=glimpse-desktop-bin
pkgver=0.17.0
pkgrel=1
pkgdesc="Desktop shell suite for Wayland compositors: panel, wallpaper, lock screen and night light"
arch=('x86_64')
url="https://github.com/alex-oleshkevich/glimpse"
license=('BSD-3-Clause')
depends=('gtk4' 'libadwaita' 'gtk4-layer-shell' 'geoclue' 'libpulse' 'pam' 'glib2>=2.80')
optdepends=(
    'upower: battery level and peripheral charge'
    'power-profiles-daemon: power modes in the battery popover'
    'networkmanager: the network applet'
    'bluez: the bluetooth applet'
    'bluez-obex: receiving files over bluetooth'
    'udisks2: the removable-media applet'
    'cups: the printing applet'
    'kdeconnect: the phone applet'
    'ddcutil: its udev rule lets the brightness applet reach external displays'
    'xdg-desktop-portal: routes app inhibit requests to glimpse-idle'
    'libnotify: notifications from SDK applets'
    'wl-clipboard: clipboard from SDK applets'
)
# cargo already strips (profile.release strip = true), so splitting debug symbols yields a
# package of nothing but .build-id links that pacman will not remove with its parent.
options=('!debug')
backup=(
    'etc/geoclue/conf.d/glimpse.conf'
    'etc/pam.d/glimpse-lock'
    'etc/xdg-desktop-portal/glimpse-portals.conf'
    'etc/xdg-desktop-portal/niri-portals.conf'
    'etc/xdg-desktop-portal/hyprland-portals.conf'
)
provides=('glimpse-desktop')
conflicts=('glimpse-desktop')
source_x86_64=("glimpse-$pkgver-x86_64.tar.zst::$url/releases/download/v$pkgver/glimpse-$pkgver-x86_64.tar.zst")
b2sums_x86_64=('9711409b786b8dfee8e218ca4043c174dcfd5ee7eda1f263585f10337e6b34f8ddfc1637fc8715a5b5acce87025d71f64dace2ae00aabab0547888858f140fb8')

package() {
    cp -a "$srcdir/usr" "$pkgdir/"
    if [[ -d "$srcdir/etc" ]]; then
        cp -a "$srcdir/etc" "$pkgdir/"
    fi
    install -Dm644 "$srcdir/usr/share/glimpse/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
