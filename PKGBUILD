# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=docx2txt
pkgname="python-${_pkgname}"
pkgver=0.9
pkgrel=1
pkgdesc="A pure python-based utility to extract text and images from docx files."
arch=("any")
url="https://github.com/ankushshah89/${pkgname}"
license=('MIT')
depends=("python")
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('18013f6229b14909028b19aa7bf4f8f3d6e4632d7b089ab29f7f0a4d1f660e28')

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
