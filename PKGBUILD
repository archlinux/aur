# Maintainer: czyt <czytcn@gmail.com>
pkgname=uu-remote-bin
pkgver=0.1.6
pkgrel=1
pkgdesc="非官方 UU 远程 Linux 被控端，纯 Rust 实现，可用官方客户端远程控制 Linux 桌面"
arch=('x86_64')
url="https://github.com/VallierDev/uu-remote-linux"
license=('GPL-3.0-only')
install="${pkgname}.install"
depends=('gtk3' 'ffmpeg' 'libpulse' 'pam' 'systemd')
optdepends=(
    'wl-clipboard: Wayland clipboard sync'
    'libpipewire: Wayland portal screen capture'
    'nvidia-utils: NVENC hardware encoding on NVIDIA GPUs'
)
provides=('uu-remote')
conflicts=('uu-remote')
source=("uu-remote-native.service")
source_x86_64=("uu-remote-linux-v${pkgver}-x86_64-linux.tar.gz::https://github.com/VallierDev/uu-remote-linux/releases/download/v${pkgver}/uu-remote-linux-v${pkgver}-x86_64-linux.tar.gz")
sha256sums=('910d0627d7b1b7edc2408d9def0dacecf92db01e43c094f10f250a22e7efbdc6')
sha256sums_x86_64=('2bad52885196d991b4217e1af0d097a3333a790477ca9f87a2e298c3e42c8c22')

package() {
    local _dir="uu-remote-linux-v${pkgver}-x86_64-linux"

    install -Dm755 "${srcdir}/${_dir}/uuremote-server" "${pkgdir}/usr/bin/uuremote-server"
    install -Dm644 "${srcdir}/${_dir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # systemd user service for unattended autostart
    install -Dm644 "${srcdir}/uu-remote-native.service" \
        "${pkgdir}/usr/lib/systemd/user/uu-remote-native.service"
}
