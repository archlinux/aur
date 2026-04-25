# Maintainer: fibsussy <fibsussy@tuta.io>
pkgname=keymux
pkgver=1.3.1
pkgrel=1
pkgdesc="Keyboard middleware for gaming with low-level input interception"
arch=('x86_64' 'aarch64')
url="https://github.com/fibsussy/keymux"
license=('MIT')
depends=('udev' 'libevdev')
makedepends=()
optdepends=('systemd: for systemd service files (or use OpenRC/runit scripts)'
            'openrc: for OpenRC init scripts'
            'runit: for runit service directories'
            'niri: automatic game mode detection in Niri compositor'
            'hyprland: automatic game mode detection in Hyprland compositor'
            'sway: automatic game mode detection in Sway compositor'
            'i3-wm: automatic game mode detection in i3 window manager'
            'bspwm: automatic game mode detection in bspwm window manager')
options=('!debug')

_arch="$CARCH"
if [ "$_arch" = "x86_64" ]; then
    _arch="x86_64"
elif [ "$_arch" = "aarch64" ]; then
    _arch="aarch64"
fi

source=(
    "https://github.com/fibsussy/keymux/releases/download/v${pkgver}/keymux-${pkgver}-${_arch}.tar.gz"
    "LICENSE::https://raw.githubusercontent.com/fibsussy/keymux/v${pkgver}/LICENSE"
    "keymux.service::https://raw.githubusercontent.com/fibsussy/keymux/v${pkgver}/systemd/keymux.service"
    "keymux-niri.service::https://raw.githubusercontent.com/fibsussy/keymux/v${pkgver}/systemd/keymux-niri.service"
    "keymux-hyprland.service::https://raw.githubusercontent.com/fibsussy/keymux/v${pkgver}/systemd/keymux-hyprland.service"
    "keymux-sway.service::https://raw.githubusercontent.com/fibsussy/keymux/v${pkgver}/systemd/keymux-sway.service"
    "keymux-i3.service::https://raw.githubusercontent.com/fibsussy/keymux/v${pkgver}/systemd/keymux-i3.service"
    "keymux-bspwm.service::https://raw.githubusercontent.com/fibsussy/keymux/v${pkgver}/systemd/keymux-bspwm.service"
    "openrc-keymux::https://raw.githubusercontent.com/fibsussy/keymux/v${pkgver}/openrc/keymux"
    "openrc-keymux-niri::https://raw.githubusercontent.com/fibsussy/keymux/v${pkgver}/openrc/keymux-niri"
    "openrc-keymux-hyprland::https://raw.githubusercontent.com/fibsussy/keymux/v${pkgver}/openrc/keymux-hyprland"
    "openrc-keymux-sway::https://raw.githubusercontent.com/fibsussy/keymux/v${pkgver}/openrc/keymux-sway"
    "openrc-keymux-i3::https://raw.githubusercontent.com/fibsussy/keymux/v${pkgver}/openrc/keymux-i3"
    "openrc-keymux-bspwm::https://raw.githubusercontent.com/fibsussy/keymux/v${pkgver}/openrc/keymux-bspwm"
    "runit-keymux-run::https://raw.githubusercontent.com/fibsussy/keymux/v${pkgver}/runit/keymux/run"
    "runit-keymux-log-run::https://raw.githubusercontent.com/fibsussy/keymux/v${pkgver}/runit/keymux/log/run"
    "runit-keymux-niri-run::https://raw.githubusercontent.com/fibsussy/keymux/v${pkgver}/runit/keymux-niri/run"
    "runit-keymux-niri-log-run::https://raw.githubusercontent.com/fibsussy/keymux/v${pkgver}/runit/keymux-niri/log/run"
    "runit-keymux-hyprland-run::https://raw.githubusercontent.com/fibsussy/keymux/v${pkgver}/runit/keymux-hyprland/run"
    "runit-keymux-hyprland-log-run::https://raw.githubusercontent.com/fibsussy/keymux/v${pkgver}/runit/keymux-hyprland/log/run"
    "runit-keymux-sway-run::https://raw.githubusercontent.com/fibsussy/keymux/v${pkgver}/runit/keymux-sway/run"
    "runit-keymux-sway-log-run::https://raw.githubusercontent.com/fibsussy/keymux/v${pkgver}/runit/keymux-sway/log/run"
    "runit-keymux-i3-run::https://raw.githubusercontent.com/fibsussy/keymux/v${pkgver}/runit/keymux-i3/run"
    "runit-keymux-i3-log-run::https://raw.githubusercontent.com/fibsussy/keymux/v${pkgver}/runit/keymux-i3/log/run"
    "runit-keymux-bspwm-run::https://raw.githubusercontent.com/fibsussy/keymux/v${pkgver}/runit/keymux-bspwm/run"
    "runit-keymux-bspwm-log-run::https://raw.githubusercontent.com/fibsussy/keymux/v${pkgver}/runit/keymux-bspwm/log/run"
)
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

package() {
    install -Dm755 "$srcdir/keymux" "$pkgdir/usr/bin/keymux"

    # Install systemd services (if systemd is detected)
    if [ -d "/run/systemd/system" ]; then
        install -Dm644 "$srcdir/keymux.service" "$pkgdir/usr/lib/systemd/system/keymux.service"

        if pacman -Qq niri &>/dev/null; then
            install -Dm644 "$srcdir/keymux-niri.service" "$pkgdir/usr/lib/systemd/user/keymux-niri.service"
        fi
        if pacman -Qq hyprland &>/dev/null; then
            install -Dm644 "$srcdir/keymux-hyprland.service" "$pkgdir/usr/lib/systemd/user/keymux-hyprland.service"
        fi
        if pacman -Qq sway &>/dev/null; then
            install -Dm644 "$srcdir/keymux-sway.service" "$pkgdir/usr/lib/systemd/user/keymux-sway.service"
        fi
        if pacman -Qq i3-wm &>/dev/null; then
            install -Dm644 "$srcdir/keymux-i3.service" "$pkgdir/usr/lib/systemd/user/keymux-i3.service"
        fi
        if pacman -Qq bspwm &>/dev/null; then
            install -Dm644 "$srcdir/keymux-bspwm.service" "$pkgdir/usr/lib/systemd/user/keymux-bspwm.service"
        fi
    fi

    # Install OpenRC scripts (if OpenRC is detected)
    if [ -d "/etc/openrc" ] || [ -d "/etc/init.d" ]; then
        install -Dm755 "$srcdir/openrc-keymux" "$pkgdir/etc/init.d/keymux"

        if pacman -Qq niri &>/dev/null; then
            install -Dm755 "$srcdir/openrc-keymux-niri" "$pkgdir/etc/init.d/keymux-niri"
        fi
        if pacman -Qq hyprland &>/dev/null; then
            install -Dm755 "$srcdir/openrc-keymux-hyprland" "$pkgdir/etc/init.d/keymux-hyprland"
        fi
        if pacman -Qq sway &>/dev/null; then
            install -Dm755 "$srcdir/openrc-keymux-sway" "$pkgdir/etc/init.d/keymux-sway"
        fi
        if pacman -Qq i3-wm &>/dev/null; then
            install -Dm755 "$srcdir/openrc-keymux-i3" "$pkgdir/etc/init.d/keymux-i3"
        fi
        if pacman -Qq bspwm &>/dev/null; then
            install -Dm755 "$srcdir/openrc-keymux-bspwm" "$pkgdir/etc/init.d/keymux-bspwm"
        fi
    fi

    # Install runit service directories (if runit is detected)
    if [ -d "/etc/runit" ] || [ -d "/service" ]; then
        mkdir -p "$pkgdir/etc/sv/keymux/log"
        install -Dm755 "$srcdir/runit-keymux-run" "$pkgdir/etc/sv/keymux/run"
        install -Dm755 "$srcdir/runit-keymux-log-run" "$pkgdir/etc/sv/keymux/log/run"

        if pacman -Qq niri &>/dev/null; then
            mkdir -p "$pkgdir/etc/sv/keymux-niri/log"
            install -Dm755 "$srcdir/runit-keymux-niri-run" "$pkgdir/etc/sv/keymux-niri/run"
            install -Dm755 "$srcdir/runit-keymux-niri-log-run" "$pkgdir/etc/sv/keymux-niri/log/run"
        fi
        if pacman -Qq hyprland &>/dev/null; then
            mkdir -p "$pkgdir/etc/sv/keymux-hyprland/log"
            install -Dm755 "$srcdir/runit-keymux-hyprland-run" "$pkgdir/etc/sv/keymux-hyprland/run"
            install -Dm755 "$srcdir/runit-keymux-hyprland-log-run" "$pkgdir/etc/sv/keymux-hyprland/log/run"
        fi
        if pacman -Qq sway &>/dev/null; then
            mkdir -p "$pkgdir/etc/sv/keymux-sway/log"
            install -Dm755 "$srcdir/runit-keymux-sway-run" "$pkgdir/etc/sv/keymux-sway/run"
            install -Dm755 "$srcdir/runit-keymux-sway-log-run" "$pkgdir/etc/sv/keymux-sway/log/run"
        fi
        if pacman -Qq i3-wm &>/dev/null; then
            mkdir -p "$pkgdir/etc/sv/keymux-i3/log"
            install -Dm755 "$srcdir/runit-keymux-i3-run" "$pkgdir/etc/sv/keymux-i3/run"
            install -Dm755 "$srcdir/runit-keymux-i3-log-run" "$pkgdir/etc/sv/keymux-i3/log/run"
        fi
        if pacman -Qq bspwm &>/dev/null; then
            mkdir -p "$pkgdir/etc/sv/keymux-bspwm/log"
            install -Dm755 "$srcdir/runit-keymux-bspwm-run" "$pkgdir/etc/sv/keymux-bspwm/run"
            install -Dm755 "$srcdir/runit-keymux-bspwm-log-run" "$pkgdir/etc/sv/keymux-bspwm/log/run"
        fi
    fi

    install -Dm644 "$srcdir/config.example.ron" "$pkgdir/usr/share/doc/keymux/config.example.ron"
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/keymux/README.md"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/keymux/LICENSE"
    install -dm755 "$pkgdir/usr/share/bash-completion/completions"
    install -dm755 "$pkgdir/usr/share/zsh/site-functions"
    install -dm755 "$pkgdir/usr/share/fish/vendor_completions.d"
    "$srcdir/keymux" completion bash > "$pkgdir/usr/share/bash-completion/completions/keymux"
    "$srcdir/keymux" completion zsh > "$pkgdir/usr/share/zsh/site-functions/_keymux"
    "$srcdir/keymux" completion fish > "$pkgdir/usr/share/fish/vendor_completions.d/keymux.fish"
    install -dm755 "$pkgdir/etc/skel/.config/keymux"
}
