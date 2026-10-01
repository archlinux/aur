# Contributor: Chris Oelmueller <chris.oelmueller@gmail.com>
# Contributor: devome <evinedeng@hotmail.com>
# Maintainer: Umar Alfarouk <medrivia@gmail.com>

_pkgname=mmh3
pkgname="python-${_pkgname}"
pkgver=5.3.1
pkgrel=1
pkgdesc="Python extension for MurmurHash (MurmurHash3), a set of fast and robust hash functions."
arch=("x86_64" "aarch64" "i686")
url="https://github.com/hajimes/${_pkgname}"
license=('MIT')
depends=("python")
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
b2sums=('a19673340839867d78bd35412f4a217218707ae2b4ca781ab1d98f783eeebde3ee6598ad0fb83fa991823ca2f6ff6bce6502b5cb845888b1d08a4dd6c8b2ed17')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
