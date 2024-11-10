pkgname='python-borghash'
_module='borghash'
_src_folder='borghash-0.0.2'
pkgver='0.0.1'
pkgrel=1
pkgdesc='Memory-efficient hash table (implemented in Cython)'
url='https://github.com/borgbackup/borghash'
depends=(
        'python>=3.12'
)
makedepends=(
        'python-build'
        'python-installer'
        'python-wheel'
)
license=('BSD-3-Clause')
arch=('any')
source=("${url}/releases/download/${pkgver}/${_module}-${pkgver}.tar.gz")
b2sums=('26a890ac303c41924e57770dd7fb17a3d1bf0b20c7c739dcf32b59470626c104')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m installer --compile-bytecode=2 --destdir="${pkgdir}" dist/*.whl
}
