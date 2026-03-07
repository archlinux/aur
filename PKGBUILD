# Maintainer: Ahmed Zaki <ahmed@zakii.de>

pkgname=gitfourchette-git
pkgver=1.6.0.r20.g6bf85b7e
pkgrel=1
pkgdesc="The comfortable Git UI for Linux"
arch=('any')
url="https://gitfourchette.org"
license=('GPL3')
provides=('gitfourchette')
conflicts=('gitfourchette' 'gitfourchette-bin')
depends=(
    python
    python-pyqt6
    python-pygit2
    git
)
makedepends=(
    python-build
    python-installer
    python-wheel
    python-setuptools
)
optdepends=(
    "python-pygments: syntax highlighting"
    "python-mfusepy: mount commits as a FUSE filesystem (requires fuse3)"
)
source=("git+https://github.com/jorio/gitfourchette.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/gitfourchette"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/gitfourchette"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/gitfourchette"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 pkg/gitfourchette.desktop \
        "$pkgdir/usr/share/applications/gitfourchette.desktop"

    install -Dm644 gitfourchette/assets/icons/gitfourchette.png \
        "$pkgdir/usr/share/pixmaps/gitfourchette.png"
}
