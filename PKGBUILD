# Maintainer: Clemens Brunner <clemens dot brunner at gmail dot com>
pkgname=python-mnelab
_pkgname=mnelab
pkgver=1.1.0
pkgrel=1
pkgdesc="Graphical user interface (GUI) for MNE, a Python package for EEG/MEG analysis"
arch=('any')
url="https://github.com/cbrnr/mnelab"
license=('BSD')
depends=(
    'pyside6'
    'python'
    'python-black'
    'python-edfio'
    'python-isort'
    'python-matplotlib'
    'python-mne'
    'python-numpy'
    'python-onnx'
    'python-pybv'
    'python-pyxdf'
    'python-scipy'
    'qt6-svg'
)
optdepends=('python-picard' 'python-scikit-learn')
makedepends=('python-build' 'python-installer' 'python-uv-build')
source=(
    "https://files.pythonhosted.org/packages/source/m/mnelab/mnelab-$pkgver.tar.gz"
    "mnelab.desktop"
    "mnelab-mimetypes.xml"
)
sha256sums=(
    '3f0fba47fb3f6c7de23f3156aa58014560e61e872e117e08aa7db33a2421d983'
    '90465ed1dcd28013a24a9410d9ea7529e9a94e58325d54d57dacf7c0552ec3ae'
    '566cccf86be39eed374a3cfa3905945c9aa60e553b73c4758c2c66d46184c977'
)

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"

    # Install the Python package normally
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Install .desktop entry
    install -Dm644 "$srcdir/mnelab.desktop" "$pkgdir/usr/share/applications/mnelab.desktop"

    # Install MIME types
    install -Dm644 "$srcdir/mnelab-mimetypes.xml" "$pkgdir/usr/share/mime/packages/mnelab.xml"

    # Install icon
    install -Dm644 "src/mnelab/icons/mnelab-logo.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/mnelab.svg"

    # Install README and LICENSE
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
