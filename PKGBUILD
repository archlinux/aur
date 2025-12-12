# Maintainer: Štěpán Mikéska <stepan@nesp.im>
pkgname=pisek-git
pkgver=2.2.1.r0.g2b2213d
pkgrel=1
pkgdesc='Tool for developing tasks for programming competetions'
url='github.com/piskoviste/pisek'
depends=('python>=3.11.0' python-colorama python-argcomplete python-pydantic python-readchar diffutils gcc)
makedepends=(git python-build python-installer python-wheel python-setuptools)
checkdepends=()
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
license=('GPL-3.0-or-later')
arch=('any')
source=('git+https://github.com/piskoviste/pisek.git#branch=master')
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    git -C "${srcdir}/${pkgname%-git}" clean -dfx
}

build() {
    cd "${pkgname%-git}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname%-git}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
