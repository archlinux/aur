# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-cu2qu-git
pkgver=1.6.7.post2.r0.g4cbc9b6
pkgrel=2
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
    git
    python-{build,installer,wheel}
    python-setuptools-scm)
checkdepends=(python-coverage
    python-pytest-runner)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare()
{
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd "$pkgname"
    python -m build -wn
}

check() {
    cd "$pkgname"
    python -m unittest discover
}

package() {
    cd "$pkgname"
    python -m installer -d "$pkgdir" dist/*.whl
}

