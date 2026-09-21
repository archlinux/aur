# Maintainer: Kristofer Lund <kristoferlund@users.noreply.github.com>
pkgname=ostt-cuda-bin
pkgver=0.0.26
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
sha256sums=('75acbc0c7208c44cc0f6f71031244ee3838f952626765e64a213fd04dbb5ec06'
            '8bcb6bd9c06c2cce21a54db8e1455c1aa154275667828f772dd74d03272e65bd'
            'ca1e19b9f5580b1a9eec2813f5af9c41ea6aac4aa3ee2bedf85effe0399fd4c5'
            'eee8a731da1c24283ae7de21f6f748cf1c02c3e17eb38ccbd4b0aebcd93cf9a0'
            'ac85f0c45978d869da155fc6735a56030b865d16ed5f03d999197c7c6a96e83a')

package() {
    install -Dm755 ostt "${pkgdir}/usr/bin/ostt"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 ostt.bash "${pkgdir}/usr/share/bash-completion/completions/ostt"
    install -Dm644 _ostt "${pkgdir}/usr/share/zsh/site-functions/_ostt"
    install -Dm644 ostt.fish "${pkgdir}/usr/share/fish/vendor_completions.d/ostt.fish"
}
