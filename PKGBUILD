# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: wisp3rwind <17089248+wisp3rwind@users.noreply.github.com>

pkgname=beets-alternatives-git
pkgver=0.14.0.r7.g8a0f5c8
pkgrel=1
pkgdesc="Beets plugin to manage external files"
arch=('any')
url="https://github.com/geigerzaehler/beets-alternatives"
license=('MIT')
depends=('python' 'beets>=1.4.7')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-hatchling')
provides=("${pkgname%-git}=${pkgver}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
    cd beets-alternatives
    git describe --long --tags | sed 's/^v//;s/[^-]*-g/r&/;s/-/./g'
}

build() {
    cd beets-alternatives
    python -m build --wheel --no-isolation
}

package() {
    cd beets-alternatives
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}

# vim: set et sw=4 ts=4 :
