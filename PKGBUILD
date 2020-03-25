# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=python-sureal
pkgver=0.4.2
pkgrel=1
pkgdesc='Subjective quality scores recovery from noisy measurements'
arch=('any')
url='https://github.com/Netflix/sureal/'
license=('Apache')
depends=('python' 'python-numpy' 'python-scipy' 'python-matplotlib' 'python-pandas')
makedepends=('python-setuptools')
checkdepends=('python-mock' 'python-pytest-cov' 'python-pytest')
BUILDENV=('!check') # test hangs after completion
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/Netflix/sureal/archive/v${pkgver}.tar.gz")
sha256sums=('3dd7aaf4752f99798f5a842cd6eef5f2984edd8512a748a3f5d3f1a49cbf8055')

build() {
    cd "sureal-${pkgver}"
    python setup.py build
}

check() {
    cd "sureal-${pkgver}"
    pytest
}

package() {
    cd "sureal-${pkgver}"
    python setup.py install --root="$pkgdir" --skip-build --optimize='1'
}
