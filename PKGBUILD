# Maintainer: Ole Petter Orhagen <ole at orhagen dot no>

pkgname=python-cfbs-git
_name=${pkgname#python-}
pkgver=4.0.6.r0.g1cad09d
pkgrel=1
pkgdesc="Tooling to build, manage and deploy CFEngine policy"
arch=('any')
url='https://cfengine.com'
license=('MIT')
groups=('cfengine-dev')
depends=(
    'git'
    'rsync'
)
makedepends=('git' 'python-setuptools')
optdepends=('autoconf: for configuring sources to build')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}-${pkgver}::git+https://github.com/cfengine/cfbs.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname}-${pkgver}"
    printf "%s" "$(git describe --tags --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g')"
}

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
