# Maintainer: devome <evinedeng@hotmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

_pkgname=lru-dict
_pipname="${_pkgname}"
pkgname="python-${_pkgname}"
pkgver=1.3.0
pkgrel=2
pkgdesc="An Dict like LRU container."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/amitdev/lru-dict"
license=("MIT")
depends=("python")
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('54fd1966d6bd1fcde781596cb86068214edeebff1db13a2cea11079e3fd07b6b')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
