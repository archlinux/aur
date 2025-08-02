# Maintainer: Ming Li <mingmillennium@gmail.com>
pkgname=m2k-pomodoro-timer
pkgver=1.0.1
pkgrel=1
pkgdesc="A lightweight Pomodoro timer with zero dependencies - runs with pure Python"
arch=('any')
url="https://github.com/ming2k/pomodoro-timer"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
optdepends=(
    'python-gobject: GTK4 modern interface support'
    'python-cairo: GTK4 modern interface support'
    'gtk4: GTK4 modern interface support'
    'libadwaita: GTK4 modern interface support'
    'python-sounddevice: Enhanced audio with PipeWire support'
    'python-numpy: Enhanced audio generation'
    'pipewire: Modern audio backend'
    'alsa-utils: Audio playback (aplay)'
    'ffmpeg: Audio playback fallback'
    'mplayer: Audio playback fallback'
    'libnotify: Native desktop notifications (notify-send)'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "pomodoro-timer-$pkgver"
    
    # Build wheel package - no external dependencies needed!
    python -m build --wheel --no-isolation
}

package() {
    cd "pomodoro-timer-$pkgver"
    
    # Install the wheel using python-installer
    python -m installer --destdir="$pkgdir" dist/*.whl
    
    # Install desktop file
    install -Dm644 pomodoro-timer.desktop "$pkgdir/usr/share/applications/pomodoro-timer.desktop"
    
    # Install icon
    install -Dm644 pomodoro-timer.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/pomodoro-timer.svg"
    
    # Install license (if exists)
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 2>/dev/null || true
    
    # Install README and documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
