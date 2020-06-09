# Maintainer: Jérôme Deuchnord <jerome@deuchnord.fr>

pkgname=kosmorro
pkgver=0.8.1
pkgrel=1
pkgdesc='A program that computes the ephemerides'
depends=('python>=3.5.0' 'python<4.0.0'
         'python-skyfield>=1.17' 'python-skyfield<2.0.0'
         'python-numpy>=1.17.0' 'python-numpy<2.0.0'
         'python-tabulate' 'python-dateutil')
optdepends=('texlive-bin: PDF creation support'
            'python-latex: PDF creation support')
makedepends=('python-setuptools' 'python-wheel'
             'ruby-ronn')
arch=('any')
url='http://kosmorro.space'
license=('AGPL3')

source=("$pkgname-v$pkgver.tar.gz::https://github.com/Deuchnord/kosmorro/archive/v${pkgver}.tar.gz"
        "$pkgname-v$pkgver-locales.tar::https://github.com/Deuchnord/kosmorro/releases/download/v0.8.1/locales.tar.gz")
sha256sums=("5faca5e2f046684c3f8b6aeeb25c1c614a6f882996e2cf9200b5f66d88b6f9fc"
            "2f112f971c27bd40e9e1e495da92f33f698f5e2a42813ae92882727f41e4a103")

build() {
    pip install --user --isolated Babel
    cp -r ${srcdir}/kosmorrolib/locales/* ${srcdir}/kosmorro-${pkgver}/kosmorrolib/locales

    cd "${srcdir}/kosmorro-${pkgver}"
    make build
}

package() {
    cd "${srcdir}/kosmorro-${pkgver}"
    python3 setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
