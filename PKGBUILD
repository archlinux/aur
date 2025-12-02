# Maintainer: devome <evinedeng@hotmail.com>
# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Philippe Hürlimann <p at hurlimann dot org>

_pkgname=ftfy
pkgname="python-${_pkgname}"
pkgver=6.3.1
pkgrel=2
pkgdesc="Fixes mojibake and other problems with Unicode, after the fact"
url="https://github.com/LuminosoInsight/${pkgname}"
arch=('any')
license=('MIT')
depends=('python' 'python-wcwidth')
makedepends=('python-build' 'python-hatchling' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('9b3c3d90f84fb267fe64d375a07b7f8912d817cf86009ae134aa03e1819506ec')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE*
    install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}"      CHANGELOG.md README.md
}
