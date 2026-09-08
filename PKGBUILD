# Maintainer: blitzkriegfc <blitzkriegfc@gmail.com>
pkgname=qbzd-bin
pkgver=2.1.0
pkgrel=1
pkgdesc="QBZ headless Qobuz daemon for servers and appliances (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/vicrodh/qbz"
license=('MIT')
depends=('alsa-lib')
optdepends=(
    'pipewire: PipeWire device discovery and sample-rate control'
    'libpulse: PulseAudio device discovery and routing through pactl'
    'jack2: JACK audio backend'
    'xdg-utils: Open the login URL in a browser when one is available'
)
provides=('qbzd')
conflicts=('qbzd' 'qbzd-git')
options=('!strip')
install=qbzd.install
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/vicrodh/qbz/releases/download/v${pkgver}/qbzd-${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/vicrodh/qbz/releases/download/v${pkgver}/qbzd-${pkgver}-linux-aarch64.tar.gz")
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
    local release_arch
    case "$CARCH" in
        x86_64) release_arch=amd64 ;;
        aarch64) release_arch=aarch64 ;;
    esac

    cd "${srcdir}/qbzd-${pkgver}-linux-${release_arch}"
    install -Dm755 qbzd "${pkgdir}/usr/bin/qbzd"
    install -Dm644 qbzd.service "${pkgdir}/usr/lib/systemd/user/qbzd.service"
    install -Dm644 completions/qbzd.bash "${pkgdir}/usr/share/bash-completion/completions/qbzd"
    install -Dm644 completions/qbzd.zsh "${pkgdir}/usr/share/zsh/site-functions/_qbzd"
    install -Dm644 completions/qbzd.fish "${pkgdir}/usr/share/fish/vendor_completions.d/qbzd.fish"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 licenses/* -t "${pkgdir}/usr/share/licenses/${pkgname}/third-party"
}
