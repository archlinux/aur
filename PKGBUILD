# Maintainer: Sašo Živanović <saso.zivanovic@guest.arnes.si>
pkgname=tandamaster
pkgver=0.3.1
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
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
md5sums=('58c184b72dacc1091f06654457f09db2')
validpgpkeys=()

prepare() {
    cd $_name-$pkgver
    ctypesgen -lmp3splt /usr/include/libmp3splt/mp3splt.h -o src/tandamaster/mp3splt_h.py
}

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
