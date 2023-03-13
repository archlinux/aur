# Maintainer: Eugene Dvoretsky <radioxoma at gmail com>

_name=heval
pkgname=$_name-git
pkgver=0.1.5.r27.g994641f
pkgrel=1
pkgdesc="Medical calculator for intensive care unit (ICU)"
arch=('any')
url="https://github.com/radioxoma/heval"
license=('GPLv3')
depends=('python' 'tk')
makedepends=('git' 'python-build' 'python-installer')
provides=("$_name")
source=("$pkgname::git+https://github.com/radioxoma/heval")
sha256sums=('SKIP')

pkgver() {
    cd $pkgname
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd $pkgname
    python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
    cd $pkgname
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 "heval.desktop" -t "$pkgdir/usr/share/applications"
    install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$_name"
}
