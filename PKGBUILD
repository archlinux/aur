# Maintainer: Jérôme Deuchnord <jerome@deuchnord.fr>

pkgname=python-kosmorrolib
pkgver=1.0.2
pkgrel=1
pkgdesc='A library to compute the ephemerides'

depends=('python'
         'python-skyfield>=1.21' 'python-skyfield<2.0'
         'python-skyfield-data>=3.0.0' 'python-skyfield-data<4.0.0'
         'python-dateutil>=2.8.0' 'python-dateutil<3.0.0'
        )

makedepends=('python-pip'
             'python-poetry'
            )

arch=('any')
url='https://kosmorro.space/lib'
license=('AGPL')

source=("${pkgname}-v${pkgver}.tar.gz::https://codeload.github.com/Kosmorro/lib/tar.gz/refs/tags/v${pkgver}")
sha256sums=("c76811108287117480c13d58ed488d8419635f3a5c6a20a710a11fc761925fc3")

build() {
    cd "${srcdir}/lib-${pkgver}"
    poetry build
}

package() {
    SOURCE_DIR="${srcdir}/lib-${pkgver}"
    PIP_CONFIG_FILE=/dev/null pip3 install --isolated --ignore-installed --no-deps --root="${pkgdir}/" ${SOURCE_DIR}/dist/kosmorrolib-${pkgver}-py3-none-any.whl
}
