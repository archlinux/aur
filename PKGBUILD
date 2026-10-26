
pkgname=python-dateutil-git
pkgver=3.0.0.r32.g71d92da6
pkgrel=1
pkgdesc="Provides powerful extensions to the standard datetime module"
arch=('any')
license=('BSD-3-Clause' 'Apache-2.0')
url="https://github.com/dateutil/dateutil"
depends=('python' 'python-tzdata')
makedepends=(
    git
    python-build
    python-wheel
    python-installer
    python-hatchling
    python-hatch-fancy-pypi-readme
    python-hatch-vcs
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd dateutil
    git describe --long --tags | sed 's/-/.r/;s/-/./g'
}

build() {
    cd dateutil
    python -m build --wheel --no-isolation
}

package() {
    cd dateutil
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: set ts=4 sw=4 et:
