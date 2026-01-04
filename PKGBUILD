# Maintainer: Jesus Alvarez <jesusalv@rez.codes>
pkgname=supersayer
pkgver=1.0.4
pkgrel=2
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
sha256sums=('47c5f7055b5e0e9617d2de5e11483beb1063de76c40436be57d40cf763b74a7b')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
