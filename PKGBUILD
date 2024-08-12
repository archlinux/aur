# $Id$
# Maintainer: Shane Stone <shanewstone gmail>
_pkgname=cmcrameri
pkgname=python-"${_pkgname}"
pkgver=1.9
pkgrel=1
pkgdesc="A wrapper around Fabio Crameris perceptually uniform colourmaps for geosciences."
arch=('any')
url="https://github.com/callumrollo/${_pkgname}/"
license=('MIT')
makedepends=('python-setuptools' 'python-setuptools-scm' 'python-build' 'python-wheel' 'python-installer')
depends=('python-numpy' 'python-matplotlib' 'python-packaging')
source=("${pkgname}-${pkgver}::https://github.com/callumrollo/cmcrameri/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('64949ae66f6cef480022ecd4aec91e71e565bf9058845a6beeec5ebf23054ba3aa3a3c8f1cc0d09154ca95d0615f00e1a9a43b0f58ffe36f8fbec4854711f1de')

build() {

    cd "${_pkgname}-${pkgver}"

    SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}" python -m build --wheel --no-isolation

}

package() {

    cd "${_pkgname}-${pkgver}"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
