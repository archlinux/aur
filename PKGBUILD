# Maintainer: Knotrocket <knotrocket12 at gmail dot com>

pkgname="arf-helper-git"
pkgver=r44.fb83765
pkgrel=1
pkgdesc="An fzf Pacman wrapper and AUR helper"
url="https://github.com/Samq64/arf"
arch=('any')
license=('MIT')
depends=('fzf' 'git' 'pacman' 'pyalpm' 'python' 'python-srcinfo')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=('sudo: default privilege elevation')
provides=('arf-helper')
conflicts=('arf' 'arf-helper')
source=('git+https://github.com/Samq64/arf.git')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/arf"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd arf
    python -m build --wheel --no-isolation
}

package() {
    cd arf
    python -m installer --destdir="$pkgdir" dist/*.whl
}
