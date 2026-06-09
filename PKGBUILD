# Maintainer: Kristofer Lund <kristoferlund@users.noreply.github.com>
pkgname=ostt-bin
pkgver=0.0.23
pkgrel=1
pkgdesc="Open Speech-to-Text: terminal app for recording and transcribing audio (prebuilt CPU binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/kristoferlund/ostt"
license=('MIT')
depends=('glibc' 'gcc-libs' 'openssl' 'alsa-lib' 'ffmpeg')
optdepends=(
    'wl-clipboard: clipboard support on Wayland'
    'xclip: clipboard support on X11'
    'mpv: better audio playback for `ostt replay`'
)
provides=("ostt=${pkgver}")
conflicts=('ostt')
source=('ostt.bash' '_ostt' 'ostt.fish')
source_x86_64=("ostt-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/ostt-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("ostt-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/ostt-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('ca1e19b9f5580b1a9eec2813f5af9c41ea6aac4aa3ee2bedf85effe0399fd4c5'
            'eee8a731da1c24283ae7de21f6f748cf1c02c3e17eb38ccbd4b0aebcd93cf9a0'
            'ac85f0c45978d869da155fc6735a56030b865d16ed5f03d999197c7c6a96e83a')
sha256sums_x86_64=('79151f88279b18eee49727ecfcda0d3dc690a7f8dfd4c4be4a3edf5cdf0d6c37')
sha256sums_aarch64=('9dbe8bcdea076b14aa77071218bd61e109862511347bcf191d718a03a7639fb6')

package() {
    local triple
    case "$CARCH" in
        x86_64) triple="x86_64-unknown-linux-gnu" ;;
        aarch64) triple="aarch64-unknown-linux-gnu" ;;
    esac

    install -Dm755 "ostt-${triple}/ostt" "${pkgdir}/usr/bin/ostt"
    install -Dm644 "ostt-${triple}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "ostt-${triple}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 ostt.bash "${pkgdir}/usr/share/bash-completion/completions/ostt"
    install -Dm644 _ostt "${pkgdir}/usr/share/zsh/site-functions/_ostt"
    install -Dm644 ostt.fish "${pkgdir}/usr/share/fish/vendor_completions.d/ostt.fish"
}
