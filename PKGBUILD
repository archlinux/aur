# Maintainer: Sašo Živanović <saso.zivanovic@guest.arnes.si>
pkgname=tandamaster
pkgver=0.3.2
pkgrel=1
epoch=
pkgdesc="A music player specialized for playing music at milongas"
arch=('any')
url="https://github.com/sasozivanovic/tandamaster"
license=('GPL')
groups=()
depends=(
    'qt5-base'
    'python-pyqt5'
    'gstreamer'
    # 'ipython' # temporary, for debugging purposes
    'python-mutagen'
    'python-unidecode'
    'python-bidict'
    'python-systemd'
    'python-pydantic'
    'libmp3splt'
)
makedepends=(
    'python-ctypesgen'
    'python-build'
    'python-installer'
    'python-wheel'
)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname//-/_}/${pkgname//-/_}-$pkgver.tar.gz")
md5sums=('619437e810a0e15a3f1a33fc5010792d')
validpgpkeys=()

prepare() {
    cd $pkgname-$pkgver
    ctypesgen -lmp3splt /usr/include/libmp3splt/mp3splt.h -o src/tandamaster/mp3splt_h.py
}

build() {
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
