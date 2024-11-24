pkgname='python-borghash'
_module='borghash'
pkgver='0.1.0'
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
b2sums=('7d29b5638df5813e8fc7d9d0b4c5675b9012b5a426329a74dd7cd7def7af32d2aac4e624748b637b7b2fb640e020394db3e3c138c450c3945aef715b6b0a2683')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m installer --compile-bytecode=2 --destdir="${pkgdir}" dist/*.whl
}
