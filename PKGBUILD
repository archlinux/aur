# Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>
_pkg='easybuild-easyconfigs'
pkgname="${_pkg}-git"
pkgver=4.8.2.r812.g41cde8911c
pkgrel=1
pkgdesc="A software build and installation framework for HPC systems"
arch=('any')
url="https://github.com/easybuilders/easybuild-easyconfigs"
license=('GPL2')
depends=('python' 'easybuild-easyblocks')
makedepends=('git' 'python-setuptools')
provides=("$_pkg")
source=("git+https://github.com/easybuilders/${_pkg}.git#branch=develop")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkg"
    printf "%s" "$(git describe --long | sed 's/\([^-]*-g\)/r\1/;s/.*v\(.*\)$/\1/;s/-/./g')"
}

prepare() {
    git -C "$srcdir/$_pkg" clean -dfx
}

build() {
    cd "$srcdir/$_pkg"
    python setup.py build
}

package() {
    cd "$srcdir/$_pkg"

    local python_version="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
    python setup.py install --root="$pkgdir" --optimize=1
}
