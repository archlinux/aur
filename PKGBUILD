# Maintainer: Sinoosoida <bokhonko.ma@phystech.edu>
pkgname=whisper-hotkeyd
pkgver=5.1.0
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
sha256sums=('24ab52d7401b105a83f5826ab259c13a04f5b4f94394d178802769f7a3b87404')

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
