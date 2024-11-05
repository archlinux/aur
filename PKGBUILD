# Maintainer: devome <evinedeng@hotmail.com>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Andrew Steinke <rkcf@rkcf.me>

_pkgname=arabic-reshaper
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=3.0.0
pkgrel=1
pkgdesc="Reconstruct Arabic sentences to be used in applications that do not support Arabic"
arch=('any')
url="https://github.com/mpcabd/${pkgname}"
license=('MIT')
depends=("python")
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=('python-fonttools')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pipname::1}/${_pipname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('ffcd13ba5ec007db71c072f5b23f420da92ac7f268512065d49e790e62237099')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
