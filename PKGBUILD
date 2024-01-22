# Maintainer: Groctel <aur@taxorubio.com>
# shellcheck disable=SC2034,SC2154,SC2164

_name=moderngl

pkgname=python-moderngl-git
pkgver=5.9.0.r41.g021f47f1
pkgrel=1
pkgdesc="Modern OpenGL binding for python."

arch=("any")
license=("MIT")
url="https://github.com/moderngl/moderngl"

source=("git+$url.git")
sha512sums=("SKIP")

options=(!emptydirs)

depends=(
    "libgl"
    "python"
)
makedepends=(
    "git"
    "python-build"
    "python-installer"
    "python-setuptools"
    "python-wheel"
)

pkgver () {
    cd "$srcdir/$_name"
    git describe --long --tags | sed 's/^networkx-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build () {
    cd "$srcdir/$_name"
    python -m build --wheel --no-isolation
}

package () {
    cd "$srcdir/$_name"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
