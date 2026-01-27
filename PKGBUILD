# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=ddddocr
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=1.6.0
pkgrel=1
pkgdesc="Universal verification code recognition OCR"
arch=("any")
url="https://github.com/sml2h3/${_pkgname}"
license=('MIT')
depends=(python-numpy python-onnxruntime python-opencv python-pillow)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('5e7d741158d9242ab200c3d24be40797ccb84151a85151ffea10b4adf1fd8386')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
