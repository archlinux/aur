# Maintainer: Jérôme Deuchnord <jerome@deuchnord.fr>

pkgname=python-kosmorrolib
pkgver=1.0.6
pkgrel=1
pkgdesc='A library to compute the ephemerides'

depends=(
        'python>=3.7.0'
        'python-skyfield'
        'python-skyfield-data'
        'python-dateutil'
        )

makedepends=(
        'python-pip'
        'python-poetry'
        )

arch=('any')
url='https://kosmorro.space/lib'
license=('AGPL')

source=("${pkgname}-v${pkgver}.tar.gz::https://codeload.github.com/Kosmorro/lib/tar.gz/refs/tags/v${pkgver}")
sha256sums=("5e6d6833aa718177c22c3a8251cd8e694c8af3db464c1e44120b0c72ee7d9393")

build() {
    cd "${srcdir}/lib-${pkgver}"
    poetry install
    poetry build
}

package() {
    SOURCE_DIR="${srcdir}/lib-${pkgver}"
    PIP_CONFIG_FILE=/dev/null pip3 install --isolated --ignore-installed --no-deps --root="${pkgdir}/" ${SOURCE_DIR}/dist/kosmorrolib-${pkgver}-py3-none-any.whl
    rm -rf ${pkgdir}/usr/lib/python3.10/site-packages/kosmorrolib/__pycache__
    rm ${pkgdir}/usr/lib/python3.10/site-packages/kosmorrolib-${pkgver}.dist-info/direct_url.json
}
