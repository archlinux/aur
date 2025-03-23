# Maintainer: Bozo Kopic <bozo@kopic.xyz>

_name=hat-json
pkgname=python-$_name
pkgver=0.6.2
pkgrel=1
pkgdesc="Hat JSON library"
url="https://github.com/hat-open/hat-json"
license=('Apache')
arch=('any')
depends=('python-hat-util' 'python-jsonpatch' 'python-jsonschema'
         'python-yaml' 'python-referencing' 'python-tomli-w')
makedepends=('python-build' 'python-hat-doit' 'python-installer')
source=("https://github.com/hat-open/hat-json/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e99f9e5fa84e5a6b89b83b05c083ab5ca2637743473734f72a1d444233e54ce7')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m 644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
