# Maintainer: Ben Weeks <ben.weeks@outlook.com>
pkgname=turbo-whisper
pkgver=1.0.0
pkgrel=1
pkgdesc="Voice dictation for Linux with waveform UI - SuperWhisper alternative, speech to text, OpenAI Whisper compatible"
arch=('any')
url="https://github.com/knowall-ai/turbo-whisper"
license=('MIT')
depends=(
    'python>=3.10'
    'python-pyqt6'
    'python-pyaudio'
    'python-numpy'
    'python-httpx'
    'python-pynput'
    'python-xlib'
    'python-pyautogui'
    'python-evdev'
    'portaudio'
    'xdotool'
    'xclip'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-hatchling'
)
optdepends=(
    'wtype: Wayland typing support'
    'wl-clipboard: Wayland clipboard support'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/knowall-ai/turbo-whisper/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl

    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Install desktop file
    install -Dm644 packaging/turbo-whisper.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
