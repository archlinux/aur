# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-linearmodels'
_module='linearmodels'
pkgver=4.23
pkgrel=1
pkgdesc="Linear models in Python."
url="https://bashtage.github.io/linearmodels/doc"
depends=('python-pyhdfe'
    'python-numpy'
    'python-pandas'
    'python-patsy'
    'python-scipy')
checkdepends=('python-mypy_extensions' 'python-pytest' 'python-xarray')
optdepends=('python-xarray')
makedepends=('cython' 'python-setuptools')
license=('custom:University of Illinois/NCSA Open Source License')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bashtage/linearmodels/archive/refs/tags/v${pkgver}.tar.gz"
    "https://patch-diff.githubusercontent.com/raw/bashtage/linearmodels/pull/336.patch")
sha256sums=('74e7e131b22e8817efe35b04d3d4193262ed4c17e3d2aefafc4209c69288d823'
            '3e3c40a8cf95e5ec22b46758f9799a010e88f7fc124e916fbce689afb6258acd')

prepare() {
    cd "${_module}-${pkgver}"
    patch -p1 -i ../336.patch
}

build() {
    cd "${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}

check() {
    cd "${_module}-${pkgver}"
    pytest linearmodels --skip-slow
}
