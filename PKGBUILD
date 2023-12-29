# Maintainer: Bozo Kopic <bozo@kopic.xyz>

pkgname=mkwhl
pkgver=0.3.0
pkgrel=2
pkgdesc="Python wheel creation utility"
url="https://github.com/bozokopic/mkwhl"
license=('GPL3')
arch=('any')
depends=('python-packaging' 'python-tomli')
makedepends=('python-build' 'python-installer')
source=("https://github.com/bozokopic/mkwhl/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ad3df73d717f0a436792612efa32a2d2f969f3cab3270b2e195a96b0c6b56f99')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m 644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
