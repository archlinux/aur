# Maintainer: Kristofer Lund <kristoferlund@users.noreply.github.com>
pkgname=ostt-vulkan-bin
pkgver=0.0.26
pkgrel=1
pkgdesc="Open Speech-to-Text: terminal app for recording and transcribing audio (prebuilt binary, AMD/Intel Vulkan build)"
arch=('x86_64')
url="https://github.com/kristoferlund/ostt"
license=('MIT')
depends=('glibc' 'gcc-libs' 'openssl' 'alsa-lib' 'ffmpeg' 'vulkan-icd-loader')
optdepends=(
    'vulkan-driver: GPU driver providing a Vulkan ICD (e.g. vulkan-radeon, vulkan-intel)'
    'wl-clipboard: clipboard support on Wayland'
    'xclip: clipboard support on X11'
    'mpv: better audio playback for `ostt replay`'
)
provides=("ostt=${pkgver}")
conflicts=('ostt')
source=("ostt-${pkgver}-vulkan.tar.gz::${url}/releases/download/v${pkgver}/ostt-${pkgver}-x86_64-unknown-linux-gnu-vulkan.tar.gz"
        'LICENSE'
        'ostt.bash'
        '_ostt'
        'ostt.fish')
sha256sums=('c708d43dc538d6196a1ae42e514f864b0638cab782b68f9a3e5476636aa76481'
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
