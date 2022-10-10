# Maintainer: Clemens Brunner <clemens dot brunner at gmail dot com>
pkgname=python-mnelab
_name=${pkgname#python-}
pkgver=0.8.5
pkgrel=1
pkgdesc="Graphical user interface (GUI) for MNE, a Python-based toolbox for EEG/MEG analysis"
arch=('any')
url="https://github.com/cbrnr/mnelab"
license=('BSD')
groups=()
depends=('python' 'pyside6' 'qt6-svg' 'python-numpy' 'python-scipy' 'python-matplotlib' 'python-mne' 'python-pyxdf')
makedepends=('python-build' 'python-installer')
optdepends=('python-scikit-learn')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://files.pythonhosted.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz
        mnelab.desktop)
noextract=()
sha1sums=('e73cb5ff8dcb4f4b02454af6c24ae6e60c681d10'
          '19c8abd304416595d8316f91eb2b5410aa88b070')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    mkdir -p "$pkgdir/usr/share/applications"
    cp mnelab.desktop "$pkgdir/usr/share/applications"
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
