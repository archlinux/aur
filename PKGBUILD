# Maintainer: skint007 <archlinux.repose742@passmail.net>
pkgname=clipboard-typer
pkgver=0.3.1
pkgrel=1
pkgdesc="Type clipboard contents keystroke-by-keystroke into the active window"
arch=('any')
url="https://github.com/skint007/key-sender"
license=('MIT')
depends=(
    'python>=3.12'
    'python-pynput'
    'python-pyperclip'
    'pyside6'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-hatchling'
)
checkdepends=(
    'python-pytest'
    'python-pytest-mock'
)
optdepends=(
    'python-pystray: system tray icon support'
    'python-pillow: system tray icon support'
    'ydotool: Wayland keystroke backend (recommended for KDE/GNOME)'
    'wtype: Wayland keystroke backend (requires compositor support)'
    'xdotool: X11 keystroke backend'
    'wl-clipboard: clipboard access on Wayland'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$pkgname-$pkgver"
    PYTHONPATH="$PWD/src" python -m pytest
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 clipboard-typer.service "$pkgdir/usr/lib/systemd/user/$pkgname.service"
}
