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
b2sums=('fa808d352ec71972bba57fd0ecf21b77d1d4fd2eab6be17cbe2bca857900b9c1c98a24abc989bcfcc90cad03b867f5a24ffcc3d157b7a561c97760a1cf31c427')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m installer --compile-bytecode=2 --destdir="${pkgdir}" dist/*.whl
}
