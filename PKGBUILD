# Maintainer: Jesus Alvarez <jesusalv@rez.codes>
pkgname=supersayer
pkgver=1.0.6
pkgrel=1
pkgdesc="Speech-to-text input tool for GNOME using whisper.cpp and PyGTK"
arch=('any')
url="https://git.ironandcode.com/jesusa/supersayer"
license=('MIT')
depends=(
    'python'
    'python-cyclopts'
    'python-evdev'
    'python-numpy'
    'python-pydantic'
    'python-pydantic-settings'
    'python-gobject'
    'python-rich'
    'python-sounddevice'
    'pipewire-alsa'
    'gtk4'
    'libadwaita'
    'wl-clipboard'
    'whisper.cpp'
    'whisper.cpp-model-small.en'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
optdepends=(
    'whisper.cpp-model-medium.en: higher accuracy model'
    'whisper.cpp-cuda: replace whisper.cpp with CUDA build for GPU acceleration'
)
install=supersayer.install
source=("$pkgname-$pkgver.tar.gz::https://git.ironandcode.com/jesusa/supersayer/archive/v$pkgver.tar.gz")
sha256sums=('905d8b84475d0dd32c32381a5c020c820a605edb1b7f7bfdb9b8d535f291ae7f')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
