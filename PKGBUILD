# Maintainer: Kristofer Lund <kristoferlund@users.noreply.github.com>
pkgname=ostt-cuda-bin
pkgver=0.0.33
pkgrel=1
pkgdesc="Open Speech-to-Text: terminal app for recording and transcribing audio (prebuilt binary, NVIDIA CUDA 13 build)"
arch=('x86_64')
url="https://github.com/kristoferlund/ostt"
license=('MIT')
depends=('glibc' 'gcc-libs' 'openssl' 'alsa-lib' 'ffmpeg' 'cuda>=13' 'nvidia-utils')
optdepends=(
    'wl-clipboard: clipboard support on Wayland'
    'xclip: clipboard support on X11'
    'mpv: better audio playback for `ostt replay`'
)
provides=("ostt=${pkgver}")
conflicts=('ostt')
source=("ostt-${pkgver}-cuda13.tar.gz::${url}/releases/download/v${pkgver}/ostt-${pkgver}-x86_64-unknown-linux-gnu-cuda13.tar.gz"
        'LICENSE'
        'ostt.bash'
        '_ostt'
        'ostt.fish')
sha256sums=('b01bcdd9b65a1c7638234c5241ded8abaeb97a514e0eb87621b485ef9544f94b'
            '8bcb6bd9c06c2cce21a54db8e1455c1aa154275667828f772dd74d03272e65bd'
            'de2a36070c295498fcffb293778e5c9b3983e7197d894005226c676918703061'
            'f0758cba99f876f371448d14b7ac77043204b798a07063cfa77bfedbbb4abeb6'
            '086d92b388ff2d510eaef7941cde20682a151cd6f564ac6d942f8d4be73d841d')

package() {
    install -Dm755 ostt "${pkgdir}/usr/bin/ostt"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 ostt.bash "${pkgdir}/usr/share/bash-completion/completions/ostt"
    install -Dm644 _ostt "${pkgdir}/usr/share/zsh/site-functions/_ostt"
    install -Dm644 ostt.fish "${pkgdir}/usr/share/fish/vendor_completions.d/ostt.fish"
}
