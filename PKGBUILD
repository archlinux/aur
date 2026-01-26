# Maintainer: Asa-DB <gibthecat3@gmail.com>
pkgname=pkgwhy
pkgver=0.2.0
pkgrel=1
pkgdesc="To help you remember why you installed a package"
arch=('any')
url="https://github.com/Asa-DB/pkgwhy"
license=('MIT')
depends=('python' 'pacman')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('879cec20ff05aca0a80788a4ebe62f5b7de63bd9d661415804cbad6f447e1aea')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    
    # this installs the pacman hook
    install -Dm644 hooks/pkgwhy.hook "$pkgdir/usr/share/libalpm/hooks/pkgwhy.hook"
}
