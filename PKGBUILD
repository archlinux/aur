# Maintainer: Eugene Dvoretsky <radioxoma at gmail com>

_name=heval
pkgname=$_name-git
pkgver=0.1.6.r101.gbbb74eb
pkgrel=1
pkgdesc="Medical calculator for intensive care unit (ICU)"
arch=(any)
url="https://github.com/radioxoma/heval"
license=('GPLv3')
depends=(python tk python-tkinterweb)
makedepends=(git python-{build,installer,wheel,setuptools})
provides=("$_name")
source=("git+https://github.com/radioxoma/heval")
sha256sums=('SKIP')

pkgver() {
    cd $_name
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd $_name
    python -m build --wheel --no-isolation
}

package() {
    cd $_name
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 "heval.desktop" -t "$pkgdir/usr/share/applications"
    install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$_name"
}
