# Maintainer: Asa-DB <gibthecat3@gmail.com>
pkgname=pkgwhy
pkgver=0.2.2
pkgrel=1
pkgdesc="To help you remember why you installed a package"
arch=('any')
url="https://github.com/Asa-DB/pkgwhy"
license=('MIT')
depends=('python' 'pacman')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('91b2898f825ba52f5ea4abfdea8de1e0bb1ac23dd049b66a1aac724302fe2e12')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 hooks/pkgwhy.hook "$pkgdir/usr/share/libalpm/hooks/pkgwhy.hook"
}
