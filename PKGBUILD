# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=docx2txt
pkgname="python-${_pkgname}"
pkgver=0.8
pkgrel=1
pkgdesc="A pure python-based utility to extract text and images from docx files."
arch=("any")
url="https://github.com/ankushshah89/${pkgname}"
license=('MIT')
depends=("python")
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('2c06d98d7cfe2d3947e5760a57d924e3ff07745b379c8737723922e7009236e5')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    mv "${pkgdir}/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}-py"
}
