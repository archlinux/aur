# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-fake-http-header-git
pkgver=r34.c684b6e
pkgrel=1
epoch=
pkgdesc="A python package to generate random request fields for a http header."
arch=('any')
url="https://github.com/MichaelTatarski/fake-http-header"
license=('MIT')
groups=()
depends=(
    python
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
    'git'
)
checkdepends=()
optdepends=()
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}::git+${url}.git")
noextract=()
sha256sums=('SKIP')
#validpgpkeys=()

pkgver() {
    cd "${srcdir}/${pkgname}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

build() {
    cd "${srcdir}/${pkgname}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -vDm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
