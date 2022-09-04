# Maintainer: Achmad Fathoni<fathoni(dot)id(at)gmail(dot)com>
pkgname=python-ouster-sdk
_pkgname=${pkgname:7}
pkgver=0.4.1
pkgrel=3
pkgdesc="Ouster sensor SDK"
arch=(any)
url="https://pypi.org/project/ouster-sdk/"
license=('BSD-3-Clause License')
makedepends=('python-setuptools' 'python-pytest' 'pybind11' 'jsoncpp' 'cmake' 'eigen' 'python-wheel')
depends=('python' 'python-typing_extensions' 'libtins' 'python-numpy' 'glew' 'glfw-x11')
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('3ecf459dd327d251c7537df5728b1a2ec5d9f4c7a652e9c269db7b392a3292b0')

prepare() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    sed -i '4s/21/24/' pyproject.toml
}

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}

check(){
    cd ${srcdir}/${_pkgname}-${pkgver}/tests
    pytest
}
