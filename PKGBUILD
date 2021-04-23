# Maintainer: jzbor <zborof at posteo dot de>
pkgname=moonwm
pkgver=7.0.0
pkgrel=1
pkgdesc="My own outstandingly named Window Manager (a dynamic window manager)"
arch=(x86_64 i686)
url="https://github.com/jzbor/moonwm"
license=('MIT')
groups=()
depends=(libx11 libxcb libxinerama slop xmenu xorg-xsetroot  dmenu ffmpeg geoclue i3lock imagemagick kdeconnect libnotify light network-manager-applet notification-daemon otf-nerd-fonts-fira-code pamixer picom polkit-gnome redshift skippy-xd wmname xdotool xfce4-power-manager xorg-setxkbmap xorg-xrandr xorg-xrdb xwallpaper)
makedepends=()
checkdepends=()
optdepends=(\
    'matcha-gtk-theme: a fitting GTK theme (Matcha-dark-aliz)',
    'numix-circle-icon-theme: an icon theme that fits nicely',
    'lxappearance: GUI for configuring GTK and icon theme',
	'xfce4-notifyd: a good default notification-daemon')
provides=(moonwm)
conflicts=(moonwm)
replaces=()
backup=()
options=()
source=("git+$url")
source=("$url/archive/refs/tags/$pkgver.tar.gz")
noextract=()
md5sums=('26d04522e165f1626285efbd3463c97d')
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
    make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11 FREETYPEINC=/usr/include/freetype2
}

package() {
	cd "$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR="${pkgdir}" install install-scripts
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/moonwm/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/moonwm/README.md"
}


