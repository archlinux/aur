# Maintainer: Evilchuck666 <carlos.martinez.medina1992@gmail.com>
pkgbase=pyvideokit
pkgname=(
    'python-pyvideokit-libs'
    'python-pyvideokit-cli'
)
pkgver=0.2.0
pkgrel=1
pkgdesc="FFmpeg-based video processing tools"
arch=('any')
url="https://github.com/Evilchuck666"
license=('GPL-3.0-only')
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
source=(
    "PyVideoKit-Libs-$pkgver.tar.gz::https://github.com/Evilchuck666/PyVideoKit-Libs/archive/v$pkgver.tar.gz"
    "PyVideoKit-CLI-$pkgver.tar.gz::https://github.com/Evilchuck666/PyVideoKit-CLI/archive/v$pkgver.tar.gz"
)
sha256sums=('SKIP'
            'SKIP')

build() {
    cd "$srcdir/PyVideoKit-Libs-$pkgver"
    python -m build --wheel --no-isolation

    cd "$srcdir/PyVideoKit-CLI-$pkgver"
    python -m build --wheel --no-isolation
}

package_python-pyvideokit-libs() {
    pkgdesc="Python library for FFmpeg-based video processing"
    depends=(
        'python'
        'ffmpeg'
        'sox'
    )

    cd "$srcdir/PyVideoKit-Libs-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/python-pyvideokit-libs/LICENSE"
}

package_python-pyvideokit-cli() {
    pkgdesc="CLI for PyVideoKit — FFmpeg-based video processing"
    depends=(
        'python'
        'python-click'
        'python-rich'
        'python-pyvideokit-libs'
    )

    cd "$srcdir/PyVideoKit-CLI-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    # Uncomment once LICENSE is added to PyVideoKit-CLI repo:
    # install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
