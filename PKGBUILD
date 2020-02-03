# Maintainer: Jérôme Deuchnord <jerome@deuchnord.fr>

pkgname=kosmorro
pkgver=0.5.1
pkgrel=1
pkgdesc='A program that computes the ephemerides'
depends=('python>=3.5.0' 'python<4.0.0' 'python-skyfield>=1.17' 'python-skyfield<2.0.0' 'python-numpy>=1.17.0' 'python-numpy<2.0.0' 'python-tabulate')
makedepends=('python-setuptools')
arch=('any')
url='http://kosmorro.space'
license=('AGPL3')

source=("$pkgname-v$pkgver.tar.gz::https://github.com/Deuchnord/kosmorro/archive/v${pkgver}.tar.gz" "locales.tar")
sha256sums=("bc52709aa9b58098d767bd535262d9c2258a259253e6e4598b83deb062ca4a34" "f64f5322ef7a14d9e54677ce04cb43ae53f53a4d56bfd15bbc666a84dc523b69")

build() {
    pip install --user --isolated Babel
    cp -r ${srcdir}/locales/* ${srcdir}/kosmorro-${pkgver}/kosmorrolib/locales

    cd "${srcdir}/kosmorro-${pkgver}"
    python setup.py compile_catalog build

    pip uninstall --yes Babel
}

package() {
    cd "${srcdir}/kosmorro-${pkgver}"
    python3 setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
