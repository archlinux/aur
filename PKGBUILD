# Maintainer: Sinoosoida <bokhonko.ma@phystech.edu>
pkgname=whisper-hotkeyd
pkgver=5.2.0
pkgrel=1
pkgdesc="Push-to-talk voice transcription to clipboard, with system tray"
arch=('any')
url="https://github.com/Sinoosoida/whisper-hotkeyd"
license=('MIT')
depends=(
    'python'
    'pyside6'
    'python-evdev'
    'python-pydub'
    'python-numpy'
    'python-requests'
    'python-tomli-w'
    'ffmpeg'
    'alsa-utils'
    'xclip'
    'wl-clipboard'
    'libnotify'
    'xdg-utils'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ff806d9dc2792cca0c04f26254a08d033a0da55b95f3676ce4719c585447c422')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"

    python -m installer --destdir="$pkgdir" \
        "dist/whisper_hotkeyd-${pkgver}-py3-none-any.whl"

    install -Dm644 "data/$pkgname.desktop" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"

    install -Dm644 "whisper_hotkeyd/resources/icon.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"

    install -Dm644 "data/$pkgname.service" \
        "$pkgdir/usr/lib/systemd/user/$pkgname.service"

    install -Dm644 "LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
