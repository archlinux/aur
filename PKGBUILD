# Maintainer: Illia Zavadzkyi <i68281124@gmail.com>
pkgname=python-termforge
_name=termforge
pkgver=0.1.0
pkgrel=1
pkgdesc="Forkable Python framework for building terminal emulators"
arch=('any')
url="https://github.com/user14923929/termforge"
license=('GPL-3.0-or-later')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/user14923929/termforge/archive/refs/tags/v$pkgver.tar.gz"
    "termforge.desktop"
)
sha256sums=('2fc6f41693f224a0ec69de19f99fa9fbdd2b83af3eb2d00025d739f99dfe86fb'
            'bff2bfade4b55dadb030fd63b4f8a061080389801a0f1605711fa7c9f5b6e2f7')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 "$srcdir/termforge.desktop" \
        "$pkgdir/usr/share/applications/termforge.desktop"

    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
