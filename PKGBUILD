# Maintainer: Asger Geel Weirsoe <asger@weircon.dk>
pkgname=pi3-smart-workspace
pkgver=0.3.0
pkgrel=1
pkgdesc="Switch i3 workspaces based on which output your mouse cursor is on"
arch=('any')
url="https://gitea.weircon.dk/agw/pi3-smart-workspace"
license=('Apache-2.0')
depends=('python' 'i3-wm' 'python-i3ipc' 'python-pynput')
makedepends=('python-build' 'python-installer' 'python-hatchling' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('03e419bd280f27e408478304ee44ca8519efa47fb5101d6e796d632f455552b3')

build() {
    cd "$srcdir/$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
