# Maintainer: devome <evinedeng@hotmail.com>

pkgname=python-oxmsg
_pipname="${pkgname//-/_}"
pkgver=0.0.1
pkgrel=1
pkgdesc="Extract attachments from Outlook .msg files."
arch=('any')
url="https://github.com/scanny/${pkgname}"
license=('MIT')
depends=(python-click python-olefile python-typing_extensions)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('b65c1f93d688b85a9410afa824192a1ddc39da359b04a0bd2cbd3874e84d4994')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
