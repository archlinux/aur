pkgname=e-z-recorder
pkgver=1.0
pkgrel=1
pkgdesc="E-Z Video Recording & Uploading on Linux. Install dependencies based on your session type (Wayland or X11)."
arch=('any')
url="https://github.com/verysillycat/e-z-recorder-linux"
license=('MIT')
source=("https://raw.githubusercontent.com/verysillycat/e-z-recorder-linux/main/e-z-recorder.sh")
sha256sums=('SKIP')

depends=('jq' 'ffmpeg')
optdepends=(
    'kooha: GNOME & KDE support'
    'wl-clipboard: Wayland Clipboard support'
    'slurp: Wayland wlroots based support'
    'wf-recorder: Wayland wlroots based support'
    'xclip: X11 Clipboard support'
    'slop: X11 Support'
)

package() {
    install -Dm755 "$srcdir/e-z-recorder.sh" "$pkgdir/usr/bin/e-z-recorder"
}

post_install() {
    sleep 1
    printf "\e[1;32m[!] - - - - - - - - - - - - - - - - - - - -  | IMPORTANT | - - - - - - - - - - - - - - - - - - - - [!]\e[0m\n"
    printf "\e[1;32mCheck the Optional Dependecies section to install the required dependencies based on your DE / WM :\e[0m\n"
    printf "• \e[30m\e[46m Wayland wlroots based \e[0m: wl-clipboard, slurp, wf-recorder\n"
    printf "• \e[30m\e[46m GNOME & KDE Wayland \e[0m wl-clipboard, kooha\n"
    printf "• \e[30m\e[46m Any X11 \e[0m: xclip, slop\n"
    echo ""
    printf "\e[1;32m✱ Otherwise, the script wouldn't work at all.\e[0m\n"
    sleep 2
}

post_upgrade() {
    post_install
}

post_remove() {
    printf "\e[1;31mTo Fully Uninstall, Run: \e[0m\n"
    printf "\e[30m\e[46m rm -rf ~/.config/e-z-recorder \e[0m\n"
    printf "to remove the configuration files."
}