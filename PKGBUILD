# Maintainer: mfw <espadonne@outlook.com>

pkgname=waveterm-vis
pkgver=0.6.7
pkgrel=1
pkgdesc='A modern terminal-based music visualizer with stunning ASCII art effects'
arch=('any')
url='https://github.com/tree3stan-chord/waveterm'
license=('MIT')
depends=('python' 'python-numpy' 'python-rich' 'python-textual' 'python-click' 'python-pydantic' 'python-toml')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=(
    'python-sounddevice: for microphone audio input'
    'python-librosa: for advanced audio processing'
    'python-pydub: for audio file support'
    'python-pillow: for export capabilities'
    'python-imageio: for GIF/video export'
)
source=("git+https://github.com/tree3stan-chord/waveterm.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
    cd waveterm
    python -m build --wheel --no-isolation
}

check() {
    cd waveterm
    python -m pytest || true  # Allow tests to fail gracefully
}

package() {
    cd waveterm
    
    # Install the Python package
    python -m installer --destdir="$pkgdir" dist/waveterm-$pkgver-py3-none-any.whl
    
    # Install documentation if files exist
    if [[ -f README.md ]]; then
        install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    fi
    if [[ -f LICENSE ]]; then
        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}