# Maintainer: Lukas Spies <lukas (at) photoqt _dot_ org>

pkgname=python-pymbolic
_module=pymbolic
pkgver=2025.1
pkgrel=1
pkgdesc="Pymbolic: A simple package to do symbolic math (focus on code gen and DSLs)"
url="https://github.com/inducer/pymbolic"
depends=('python-pytools' 'python-sympy' 'python-symengine')
makedepends=('python-build' 'python-installer' 'python-hatchling')
license=('MIT')
arch=('any')
source=("https://github.com/inducer/pymbolic/archive/v${pkgver}.tar.gz")
sha256sums=('f357aabcac2baecc8ddf4fc74a9f42895bc93753290cbf50d7e2407ea0fad78a')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m build --wheel --no-isolation

}

package() {

    cd "${srcdir}/${_module}-${pkgver}"

    python -m installer --destdir="$pkgdir" dist/*.whl

    # Symlink license file
    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    install -d "$pkgdir"/usr/share/licenses/$pkgname
    ln -s "$site_packages/${_module}-${pkgver}".dist-info/LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt

}
