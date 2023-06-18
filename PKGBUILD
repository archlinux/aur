# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=python-sureal
pkgver=0.9.0
pkgrel=1
pkgdesc='Subjective quality scores recovery from noisy measurements'
arch=('any')
url='https://github.com/Netflix/sureal/'
license=('Apache')
depends=('python' 'python-numpy' 'python-scipy' 'python-matplotlib' 'python-pandas' 'python-setupmeta')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
BUILDENV+=('!check')
source=("https://github.com/Netflix/sureal/archive/v${pkgver}/sureal-${pkgver}.tar.gz")
sha256sums=('874112de8b158150170c4b22458d6da4f597c7153bea295880cad83a4f5a3535')

build() {
    cd "sureal-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "sureal-${pkgver}"
    pytest
}

package() {
    python -m installer --destdir="$pkgdir" "sureal-${pkgver}/dist"/*.whl
}
