# Maintainer: Lucas <lucasion@hotmail.com>

pkgname=ionix-quickshell-git
_pkgname=ionix-quickshell
# Placeholder: aur-publish.sh patches this to the real r<count>.<hash> before
# generating .SRCINFO. Keep it in the r-scheme — a bare 0.1.0 would sort *newer*
# than every r-version if it ever reached the AUR unpatched.
pkgver=r21.2e03505
pkgrel=1
pkgdesc="Ionix Quickshell desktop shell — bar, popouts and OSD (git)"
arch=('any')
url="https://github.com/LucasionGS/ionix-quickshell"
license=('MIT')
depends=(
    'quickshell'
    'qt6-declarative'
    'qt6-svg'
    'qt6-wayland'
    'pipewire'
    'wireplumber'
    'networkmanager'
    'bluez'
    'bluez-utils'
    'upower'
    'polkit'
)
makedepends=('git')
optdepends=(
    'swaync: notification centre integration for the bell module'
    'brightnessctl: backlight control and brightness OSD'
    'pavucontrol: advanced audio settings from the audio popout'
    'blueman: bluetooth manager GUI fallback'
    'nm-connection-editor: advanced network settings from the network popout'
    'hyprland: workspace, window and blur integration'
    'hyprlock: lock action in the power menu'
    'ioexplorer-git: application launcher target for the logo button'
    'toxen-mini: Toxen music player integration'
    'ttf-jetbrains-mono-nerd: the glyph font the bar is designed around'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/LucasionGS/ionix-quickshell.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    if git describe --long --tags >/dev/null 2>&1; then
        git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    else
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    fi
}

package() {
    make -C "$srcdir/$_pkgname" DESTDIR="$pkgdir" PREFIX=/usr PKGNAME="$pkgname" install
}
