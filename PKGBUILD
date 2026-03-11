# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=ddddocr
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=1.6.1
pkgrel=1
pkgdesc="Universal verification code recognition OCR"
arch=("any")
url="https://github.com/sml2h3/${_pkgname}"
license=('MIT')
depends=(python-numpy python-onnxruntime python-opencv python-pillow)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('1c59d84d63d8703c6c486465a32389c9e41dd92852c794c5e4c0181a5f82d43a')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
