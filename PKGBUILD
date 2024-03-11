# Maintainer: Fabrice Mouhartem <aur-packages@epheme.re>
#
# Inspired by fanficfare-git's PKGBUILD
# (https://aur.archlinux.org/packages/fanficfare-git)
_pkgname=kalamine
pkgname=kalamine-git
pkgver=v0.36.r2.6004686
pkgrel=1
pkgdesc="A text-based, cross-platform Keyboard Layout Maker."
arch=('any')
url="https://github.com/OneDeadKey/${_pkgname}"
license=('MIT')
groups=()
_deps=(
        'click'
        'pyyaml'
        'setuptools'
        'tomli'
        'lxml'
        'livereload'
)
depends=("${_deps[@]/#/python-}")
makedepends=(
        'git'
        'python-hatchling'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
        cd "$srcdir/${_pkgname}"

        printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare () {
        cd "$srcdir/${_pkgname}"
        make clean
}

build() {
        cd "$srcdir/${_pkgname}"

        python -m build --wheel --no-isolation
}

package() {
        cd "$srcdir/${_pkgname}"

        python -m installer --destdir="${pkgdir}" dist/*.whl
}
