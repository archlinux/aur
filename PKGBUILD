# Maintainer: Jérôme Deuchnord <jerome@deuchnord.fr>

pkgname=python-kosmorrolib
pkgver=1.0.4
pkgrel=1
pkgdesc='A library to compute the ephemerides'

depends=('python'
         'python-skyfield>=1.21' 'python-skyfield<2.0'
         'python-skyfield-data>=3.0.0' 'python-skyfield-data<4.0.0'
         'python-dateutil>=2.8.0' 'python-dateutil<3.0.0'
        )

makedepends=(
             'python-pip'
             'python-poetry'
            )

arch=('any')
url='https://kosmorro.space/lib'
license=('AGPL')

source=("${pkgname}-v${pkgver}.tar.gz::https://codeload.github.com/Kosmorro/lib/tar.gz/refs/tags/v${pkgver}")
sha256sums=("45fb62550e7da66e2598b63e5bf87ed4e4296339eb6d751a238f487a9e56754f")

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
