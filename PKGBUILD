# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=ddddocr
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=1.5.6
pkgrel=1
pkgdesc="Universal verification code recognition OCR"
arch=("any")
url="https://github.com/sml2h3/${_pkgname}"
license=('MIT')
depends=(python-numpy python-onnxruntime python-opencv python-pillow)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('2839a940bfabe02e3284ef3f9d2a037292aa9f641f355b43a9b70bece9e1b73d')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
