# Maintainer: Groctel <aur@taxorubio.com>

_name=isosurfaces

pkgname=python-isosurfaces
pkgver=0.1.1
pkgrel=1
pkgdesc="Construct isolines/isosurfaces of a 2D/3D scalar field defined by a function."

arch=("any")
license=("MIT")
url="https://github.com/jared-hughes/isosurfaces"

source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('fe9634b7ce748ef5542826a7efd0e4f9c3059f344bf82a54933d8456b546e839f2e888db9cc63c53d166d07dc7eb0a8c314fa84e17724c01a8de1edfa5d23377')

depends=(
    "python"
    "python-numpy"
)
makedepends=(
    "python-build"
    "python-installer"
    "python-setuptools"
    "python-wheel"
)

build () {
    cd "$srcdir/$_name-$pkgver" || exit
    python -m build --wheel --no-isolation
}

package () {
    cd "$srcdir/$_name-$pkgver" || exit
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_name/LICENSE"
}
