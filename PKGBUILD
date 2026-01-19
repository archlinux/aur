# Maintainer: Jesus Alvarez <jesusalv@rez.codes>
pkgname=supersayer
pkgver=1.0.5
pkgrel=1
pkgdesc="Speech-to-text input tool for GNOME using whisper.cpp and PyGTK"
arch=('any')
url="https://github.com/demizer/supersayer"
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
    'gtk4'
    'libadwaita'
    'wl-clipboard'
    'whisper.cpp'
    'whisper.cpp-model-small.en'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
optdepends=(
    'whisper.cpp-model-medium.en: higher accuracy model'
    'whisper.cpp-cuda: GPU acceleration'
)
install=supersayer.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/demizer/supersayer/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8f6bf39c6dd0242e634c3cae340f636c832b966fec1934d84a6ca26a20539bd6')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
