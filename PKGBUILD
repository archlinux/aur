# Maintainer: Bozo Kopic <bozo@kopic.xyz>

_name=hat-json
pkgname=python-$_name
pkgver=0.5.27
pkgrel=1
pkgdesc="Hat JSON library"
url="https://github.com/hat-open/hat-json"
license=('Apache')
arch=('any')
depends=('python-hat-util' 'python-jsonpatch' 'python-jsonschema'
         'python-yaml' 'python-referencing' 'python-tomli' 'python-tomli-w')
makedepends=('python-build' 'python-hat-doit' 'python-installer')
source=("https://github.com/hat-open/hat-json/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('574b1399acf2371b8d8ebe6c6e8d896c6320623b51ec7b3cfe566988c6b2aaea')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m 644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
