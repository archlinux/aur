# Maintainer: DanielNak <daniel@tee.cat>
# Python package author: Kevin McCarthy <me@kevinmccarthy.org>

pkgname=python-vcrpy-git
_pkgname="${pkgname#python-}"
_pkgname="${_pkgname%-git}"
_author=kevin1024
pkgver=7.0.0.r24.g8217a4c
pkgrel=2
pkgdesc="Simplify and speed up tests that make HTTP requests"
arch=('any')
url="https://github.com/$_author/$_pkgname"
license=('MIT')
depends=('python' 'python-pyyaml' 'python-wrapt' 'python-yarl')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools')
provides=("python-$_pkgname=$pkgver")
conflicts=("python-$_pkgname")
source=("git+https://github.com/$_author/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --tags --long | sed 's/^[^0-9]*//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$_pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE* -t "$pkgdir/usr/share/licenses/$pkgname/"
}
