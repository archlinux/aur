# Maintainer: Knotrocket <knotrocket12 at gmail dot com>

_name=arf
pkgname="${_name}-git"
pkgver=r13.2cb27bd
pkgrel=1
pkgdesc="An fzf Pacman wrapper and AUR helper"
arch=('any')
url="https://github.com/Samq64/arf"
license=('MIT')
depends=('fzf' 'git' 'pacman' 'pyalpm' 'python' 'python-requests' 'python-srcinfo')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=('sudo: default privilege elevation')
provides=("$_name")
conflicts=("$_name")
source=('git+https://github.com/Samq64/arf.git')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_name"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $_name
    python -m build --wheel --no-isolation
}

package() {
    cd $_name
    python -m installer --destdir="$pkgdir" dist/*.whl
}
