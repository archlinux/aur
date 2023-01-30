# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-cu2qu-git
pkgver=1.6.7.post2.r0.g4cbc9b6
pkgrel=1
pkgdesc='Cubic-to-quadratic bezier curve conversion'
url='https://github.com/googlefonts/cu2qu'
license=('Apache')
arch=(any)
_pydeps=(defcon
         fonttools
         fs)
depends=(python
         "${_pydeps[@]/#/python-}")
makedepends=(cython
             python-{build,installer}
             python-setuptools-scm)
checkdepends=(git
              python-coverage
              python-pytest-runner)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$pkgname"
    python -m build -wn
}

check() {
    cd "$pkgname"
    PYTHONPATH=tests pytest
}

package() {
    cd "$pkgname"
    python -m installer -d "$pkgdir" dist/*.whl
}

