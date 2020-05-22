# Maintainer: Jérôme Deuchnord <jerome@deuchnord.fr>

pkgname=kosmorro
pkgver=0.8.0
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
        "locales.tar.xz")
sha256sums=("8bf3259a49678d7c517386417a5234b955ae1d58e6d5795bd39efd585afd9d6e"
            "5cea0f49f4efe15b948d8de2bec1f8e44786e4fe92a8b56ebb0ce2f4d7f258bb")

build() {
    pip install --user --isolated Babel
    cp -r ${srcdir}/locales/* ${srcdir}/kosmorro-${pkgver}/kosmorrolib/locales

    cd "${srcdir}/kosmorro-${pkgver}"
    make build
}

package() {
    cd "${srcdir}/kosmorro-${pkgver}"
    python3 setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
