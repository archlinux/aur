# Maintainer: IvelOt <contact@ivelot.dev>
pkgname=hal-9001-bin
_pkgname=hal-9001
pkgver=0.1.3
pkgrel=1
pkgdesc="Pure Rust TUI system control hub for Arch users (BTW) tired of 14 separate tools (No AI!) - binary release"
arch=('x86_64' 'aarch64')
url="https://github.com/IvelOt/hal-9001"
license=('MIT')
depends=('dbus' 'glibc' 'gcc-libs')
optdepends=(
    'networkmanager: suporte ao gerenciamento de Wi-Fi e rede (D-Bus)'
    'bluez: suporte a descoberta, pareamento e telemetria de Bluetooth'
    'udisks2: gerenciamento, montagem e ejeção de unidades de armazenamento'
    'upower: monitoramento de bateria e perfis de energia'
    'pipewire: mixer de áudio e controle de volume por aplicativo (via wpctl)'
    'pulseaudio: fallback de mixer de áudio (via pactl)'
    'xorg-xrandr: gerenciamento e auto-expansão de múltiplos monitores sob X11'
    'wlr-randr: gerenciamento de múltiplos monitores sob Wayland (wlroots)'
    'hyprland: gerenciamento de múltiplos monitores sob Hyprland (hyprctl)'
    'sudo: elevação de privilégios para formatação de partições e gravação de ISO'
)
provides=('hal-9001' 'hal9001')
conflicts=('hal-9001')

source_x86_64=("${url}/releases/download/v${pkgver}/hal-9001-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/hal-9001-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('e8a1675fdae10b5a6fa4ec1e8b82ec2110bd0510cf63c2e10781d2f34523c5a6')
sha256sums_aarch64=('af1115bee90a862be139c664ac211efbda9b283ea370c7f601e88a06dd4624c4')

package() {
    cd "$srcdir"

    # Binário principal pré-compilado
    install -Dm755 "hal9001" "$pkgdir/usr/bin/hal9001"
    ln -sf "/usr/bin/hal9001" "$pkgdir/usr/bin/hal-9001"

    # Arquivo Desktop e Configuração
    if [ -f "hal-9001.desktop" ]; then
        install -Dm644 "hal-9001.desktop" "$pkgdir/usr/share/applications/hal-9001.desktop"
    fi
    if [ -f "config.toml" ]; then
        install -Dm644 "config.toml" "$pkgdir/etc/hal-9001/config.toml"
        install -Dm644 "config.toml" "$pkgdir/usr/share/doc/$_pkgname/config.toml.example"
    fi
    if [ -f "README.md" ]; then
        install -Dm644 "README.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
    fi
    if [ -f "LICENSE" ]; then
        install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}
