# Maintainer: Clemens Brunner <clemens dot brunner at gmail dot com>
pkgname=python-mnelab
_pkgname=mnelab
pkgver=1.0.8
pkgrel=3
pkgdesc="Graphical user interface (GUI) for MNE, a Python package for EEG/MEG analysis"
arch=('any')
url="https://github.com/cbrnr/mnelab"
license=('BSD')
depends=('python' 'pyside6' 'qt6-svg' 'python-numpy' 'python-scipy' 'python-matplotlib' 'python-mne' 'python-pyxdf' 'python-edfio' 'python-pybv')
optdepends=('python-scikit-learn' 'python-picard')
makedepends=('python-build' 'python-uv-build' 'python-installer')
source=("https://files.pythonhosted.org/packages/source/m/mnelab/mnelab-$pkgver.tar.gz"
        "mnelab.desktop"
        "mnelab-mimetypes.xml")
sha256sums=('12c9fbcb1e359af672820be06f40e1d14548f9180c81773ae3ee622be808040c'
            '90465ed1dcd28013a24a9410d9ea7529e9a94e58325d54d57dacf7c0552ec3ae'
            '566cccf86be39eed374a3cfa3905945c9aa60e553b73c4758c2c66d46184c977')

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
