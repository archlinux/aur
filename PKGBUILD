# Contributor: Chris Oelmueller <chris.oelmueller@gmail.com>
# Contributor: devome <evinedeng@hotmail.com>
# Maintainer: Umar Alfarouk <medrivia@gmail.com>

_pkgname=mmh3
pkgname="python-${_pkgname}"
pkgver=5.3.0
pkgrel=1
pkgdesc="Python extension for MurmurHash (MurmurHash3), a set of fast and robust hash functions."
arch=("x86_64" "aarch64" "i686")
url="https://github.com/hajimes/${_pkgname}"
license=('MIT')
depends=("python")
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
b2sums=('c5af239f0594b029815237df650aefeec898c85f9d049acd3d16cab778de7fa7a99f7712196c5f325b2fcc5c593cea438c9ed3c32fbbf3e57a8af0955760d968')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
