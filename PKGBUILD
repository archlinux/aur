# Maintainer: Alexander Bocken <alexander@bocken.org>

_name=xtb
pkgname=python-${_name,,}
pkgver=22.1
pkgrel=4
pkgdesc='Python API for the extended tight-binding program xtb'
arch=('any')
url="https://github.com/grimme-lab/xtb-python"
license=('LGPL3')
depends=('python>3.7' python-numpy python-cffi xtb)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
	find_local_installs.patch
)
sha256sums=('7a59e7b783fc6e8b7328f55211de681e535a83991b07c4bab73494063f5e9018'
            'faf00b5fca74b8bb991a7aeefd70fb4bc19a410947a9858723bdcf6e49d90158')

makedepends=(python-build python-installer python-wheel meson-python)

build() {
    cd $_name-$pkgver
    patch -Np1 -i ../find_local_installs.patch
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
