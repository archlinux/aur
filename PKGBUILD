# Maintainer: Kristofer Lund <kristoferlund@users.noreply.github.com>
pkgname=ostt-bin
pkgver=0.0.34
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
sha256sums=('de2a36070c295498fcffb293778e5c9b3983e7197d894005226c676918703061'
            'f0758cba99f876f371448d14b7ac77043204b798a07063cfa77bfedbbb4abeb6'
            '086d92b388ff2d510eaef7941cde20682a151cd6f564ac6d942f8d4be73d841d')
sha256sums_x86_64=('1395495d94758c079e6b627ff072f9c5f877e193b5baa74febc04b0269842467')
sha256sums_aarch64=('666b62dbc7df09c5cdf3284e30f91aedcd79b55db5839cbfa8d719454c3b5d4c')

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
