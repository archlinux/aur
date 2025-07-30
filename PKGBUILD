# Maintainer: devome <evinedeng@hotmail.com>
# Contributer: Chris Oelmueller <chris.oelmueller@gmail.com>

_pkgname=mmh3
pkgname="python-${_pkgname}"
pkgver=5.2.0
pkgrel=1
pkgdesc="Python extension for MurmurHash (MurmurHash3), a set of fast and robust hash functions."
arch=("x86_64" "aarch64" "i686")
url="https://github.com/hajimes/${_pkgname}"
license=('MIT')
depends=("python")
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
b2sums=('ced50db669612487fe095656dd8c282e00e5bc6e3624012e0c76105bc206539055de373c32aa2e97b78a242f924e0f795f3745ed17b4921b08753071b9721ebc')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
