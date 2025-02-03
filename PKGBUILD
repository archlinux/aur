# Maintainer: devome <evinedeng@hotmail.com>

pkgname=python-oxmsg
_pipname="${pkgname//-/_}"
pkgver=0.0.2
pkgrel=1
pkgdesc="Extract attachments from Outlook .msg files."
arch=('any')
url="https://github.com/scanny/${pkgname}"
license=('MIT')
depends=(python-click python-olefile python-typing_extensions)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('a6aff4deb1b5975d44d49dab1d9384089ffeec819e19c6940bc7ffbc84775fad')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
