# Maintainer: Lucas <lucasion@hotmail.com>

pkgname=ionix-link-git
_pkgname=ionix-link
# Placeholder: aur-publish.sh patches this to the real r<count>.<hash> before
# generating .SRCINFO. Keep it in the r-scheme.
pkgver=r11.f4985b8
pkgrel=1
pkgdesc="Ionix Link desktop daemon: pair a phone for notifications, media, commands and remote input (git)"
arch=('any')
url="https://github.com/LucasionGS/ionix-link"
license=('MIT')
depends=(
    'python'
    # The daemon's TLS certificate is generated with the openssl CLI.
    'openssl'
    'systemd'
)
optdepends=(
    'qrencode: show the pairing QR code in the terminal'
    'libnotify: confirm a pairing by code from a desktop notification'
    'playerctl: media remote'
    'wireplumber: volume control (wpctl)'
    'libpulse: instant volume updates (pactl subscribe)'
    'wl-clipboard: clipboard push and pull'
    'wtype: typing from the phone keyboard'
    'grim: screen view'
    'wf-recorder: video in the screen view (H.264)'
    'hyprland: list monitors for the screen view, and the phone desktop'
    'awww: the wallpaper on the phone desktop'
    'wlr-randr: list monitors on other wlroots compositors'
    'imagemagick: cover art and the wallpaper on the phone (ffmpeg works too)'
    'xdg-utils: open shared links and files, and find the download folder'
)
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/LucasionGS/ionix-link.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    make -C "$srcdir/$_pkgname" DESTDIR="$pkgdir" PREFIX=/usr PKGNAME="$pkgname" install
}
