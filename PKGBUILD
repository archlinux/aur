# Maintainer: devome <evinedeng@hotmail.com>
# Contributer: Chris Oelmueller <chris.oelmueller@gmail.com>

_pkgname=mmh3
pkgname="python-${_pkgname}"
pkgver=5.1.0
pkgrel=1
pkgdesc="Python extension for MurmurHash (MurmurHash3), a set of fast and robust hash functions."
arch=("x86_64" "aarch64" "i686")
url="https://github.com/hajimes/${_pkgname}"
license=('MIT')
depends=("python")
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('136e1e670500f177f49ec106a4ebf0adf20d18d96990cc36ea492c651d2b406c')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
