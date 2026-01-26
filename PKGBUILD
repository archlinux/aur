# Maintainer: Asa-DB <gibthecat3@gmail.com>
pkgname=pkgwhy
pkgver=0.2.3
pkgrel=1
pkgdesc="To help you remember why you installed a package"
arch=('any')
url="https://github.com/Asa-DB/pkgwhy"
license=('MIT')
depends=('python' 'pacman')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f835fe743e5a2a8af1362452b8641001a7fac1ba6d64f1f67e86009c428d35db')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 hooks/pkgwhy.hook "$pkgdir/usr/share/libalpm/hooks/pkgwhy.hook"
}
