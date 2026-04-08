# Maintainer: Kohlbern Jary <kohlbern@gmail.com>
pkgname=echobuf
pkgver=0.4.0
pkgrel=1
pkgdesc="Instant audio sampling for Linux — continuously buffers system audio, save the last N seconds to WAV on demand"
arch=('any')
url="https://github.com/KohlJary/echobuf"
license=('MIT')
depends=(
    'python>=3.11'
    'python-numpy'
    'python-soundfile'
    'python-pulsectl'
)
optdepends=(
    'python-pystray: system tray icon'
    'python-pillow: system tray icon'
    'python-gobject: system tray icon (appindicator backend)'
    'python-pynput: built-in global hotkey support'
)
makedepends=('python-build' 'python-installer' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/e/echobuf/echobuf-${pkgver}.tar.gz")
sha256sums=('5b995d240c2472423ff6e988bb4803b7db498a3fcc649c633a597bcfe8312488')

build() {
    cd "$srcdir/echobuf-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/echobuf-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 contrib/echobuf.service "$pkgdir/usr/lib/systemd/user/echobuf.service"
}
