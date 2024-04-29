# Maintainer: Polyfish0 <igamblenull@gmail.com>
pkgname="python-pyotrs-git"
pkgdesc="Interacting with OTRS from Python"
source=("python-pyotrs-git::git+https://gitlab.com/rhab/PyOTRS.git")
url="https://gitlab.com/rhab/PyOTRS"
provides=(python-pyotrs)
depends=("python>=3.7" python-requests python-deprecation)
makedepends=(python-build python-installer python-wheel python-poetry git)
arch=(any)
license=(MIT)
pkgver=0.4.1.r187.g2034a3d
pkgrel=1
sha256sums=("SKIP")

build() {
    cd "$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

pkgver() {
    cd "$pkgname"
    git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
