# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-xmldiff-git
pkgver=3.0b1.r1.g43815ee
pkgrel=2
pkgdesc='A library and command line utility for diffing xml'
url='https://github.com/Shoobx/xmldiff'
license=('MIT')
arch=(any)
depends=(
    python
    python-lxml
)
makedepends=(
    git
    python-build
    python-installer
    python-wheel
    python-setuptools
)
provides=("${pkgname%-git}" xmldiff)
conflicts=("${pkgname%-git}" xmldiff)
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$pkgname"
    python -m build --wheel --no-isolation
}

# check() {
#     cd "$pkgname"
#     python setup.py test
# }

package() {
    cd "$pkgname"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
