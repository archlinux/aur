# Contributor: Chris Oelmueller <chris.oelmueller@gmail.com>
# Contributor: devome <evinedeng@hotmail.com>
# Maintainer: Umar Alfarouk <medrivia@gmail.com>

_pkgname=mmh3
pkgname="python-${_pkgname}"
pkgver=5.2.1
pkgrel=1
pkgdesc="Python extension for MurmurHash (MurmurHash3), a set of fast and robust hash functions."
arch=("x86_64" "aarch64" "i686")
url="https://github.com/hajimes/${_pkgname}"
license=('MIT')
depends=("python")
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
b2sums=('105fcb0bb1a320ac84366348d60375e089e369d526eae8202a209a349d27d171737f15adafee7d7a8c3728101d9f29323ff4e908f332a2533832021749cd521b')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
