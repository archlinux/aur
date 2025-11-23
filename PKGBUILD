# Maintainer: Luca Steccanella <steccas at pm dot me>
pkgname=voxd-bin
pkgver=1.7.0
pkgrel=1
pkgdesc="Voice-typing/dictation app for Linux using local speech-to-text processing (pre-built binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/jakovius/voxd"
license=('GPL-3.0-or-later')
depends=(
    'python>=3.9'
    'python-sounddevice'
    'python-pyqt6'
    'python-platformdirs'
    'python-yaml'
    'python-pyperclip'
    'python-psutil'
    'python-numpy'
    'python-requests'
    'python-tqdm'
    'python-pyqtgraph'
    'ffmpeg'
    'portaudio'
    'xclip'
    'xsel'
    'wl-clipboard'
    'xdotool'
    'ydotool'
    'xcb-util-cursor'
    'xcb-util-wm'
)
optdepends=(
    'whisper.cpp: Local speech recognition backend'
    'llama.cpp: Local AI post-processing'
)
provides=('voxd')
conflicts=('voxd' 'voxd-git')
source_x86_64=(
    "voxd-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst::https://github.com/jakovius/voxd/releases/download/v${pkgver}/voxd-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst"
)
source_aarch64=(
    "voxd-${pkgver}-${pkgrel}-aarch64.pkg.tar.zst::https://github.com/jakovius/voxd/releases/download/v${pkgver}/voxd-${pkgver}-${pkgrel}-aarch64.pkg.tar.zst"
)
sha256sums_x86_64=('f926644d84d10ed1a7abfc92afca9759ca6daad0fc92857093dfb915b7475ae4')
sha256sums_aarch64=('037e75c864f9f2df59dd996fa41905cec7a72f9d5c1b6e39b2d3350dcabc6d4c')

package() {
    # Extract the pre-built package, excluding metadata files
    if [[ "$CARCH" == "x86_64" ]]; then
        tar -xf "$srcdir/voxd-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "$pkgdir" --exclude='.INSTALL' --exclude='.MTREE' --exclude='.PKGINFO' --exclude='.BUILDINFO'
    elif [[ "$CARCH" == "aarch64" ]]; then
        tar -xf "$srcdir/voxd-${pkgver}-${pkgrel}-aarch64.pkg.tar.zst" -C "$pkgdir" --exclude='.INSTALL' --exclude='.MTREE' --exclude='.PKGINFO' --exclude='.BUILDINFO'
    fi
}
