# Maintainer: Achmad Fathoni<fathoni(dot)id(at)gmail(dot)com>
pkgname=python-ouster-sdk
_pkgname=${pkgname:7}
pkgver=0.5.1
pkgrel=1
pkgdesc="Ouster sensor SDK"
arch=(any)
url="https://pypi.org/project/ouster-sdk/"
license=('BSD')
makedepends=('python-setuptools' 'python-pytest' 'pybind11' 'jsoncpp' 'cmake' 'eigen' 'python-wheel')
depends=('python' 'python-typing_extensions' 'libtins' 'python-numpy' 'glew' 'glfw-x11')
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('3d024f35e8da9afd668e4a222192db662e6d3394a942c4f5d5c7dbfd4825a3bf')

prepare() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    sed -i '4s/, "cmake==3.21.1"//' pyproject.toml
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
