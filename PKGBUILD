# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-ttfautohint-py-git
pkgver=0.5.1.r2.g5b66ad2
pkgrel=1
pkgdesc='Python wrapper for ttfautohint, a free auto-hinter for TrueType fonts'
url='https://github.com/fonttools/ttfautohint-py'
license=('MIT')
arch=(any)
depends=(python-fonttools)
checkdepends=(python-pytest)
makedepends=(python-{build,installer}
              python-setuptools-scm
              python-wheel
              git)
checkdepends=(python-pytest)
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

# check() {
#     cd "$pkgname"
#     PYTHONPATH=Lib pytest tests
# }

package() {
    cd "$pkgname"
    python -m installer -d "$pkgdir" dist/*.whl
}

