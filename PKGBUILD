# Maintainer: Jérôme Deuchnord <jerome@deuchnord.fr>

pkgname=kosmorro
pkgver=0.9.0
pkgrel=1
pkgdesc='A program that computes the ephemerides'
depends=('python>=3.5.0' 'python<4.0.0'
         'python-skyfield>=1.21' 'python-skyfield<2.0'
         'python-numpy>=1.17.0' 'python-numpy<2.0.0'
         'python-tabulate' 'python-dateutil')
optdepends=('texlive-bin: PDF creation support'
            'python-latex: PDF creation support')
makedepends=('python-pip' 'python-setuptools' 'python-wheel'
             'ruby-ronn')
arch=('any')
url='http://kosmorro.space'
license=('AGPL3')

source=("$pkgname-v$pkgver.tar.gz::https://github.com/Deuchnord/kosmorro/archive/v${pkgver}.tar.gz"
        "$pkgname-v$pkgver-locales.tar.gz::https://github.com/Deuchnord/kosmorro/releases/download/v${pkgver}/locales.tar.gz")
sha256sums=("c875c5f31946e0ebc23e9a8b0564f318f5c752fc43d17f412105133920f79620"
            "aa0a331958848dfeb08829ef5dc162da7cbf00e26f33164fab11bb77c1eb4322")

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
