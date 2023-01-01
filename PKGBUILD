# Maintainer: Bozo Kopic <bozo@kopic.xyz>

_name=hat-json
pkgname=python-$_name
pkgver=0.5.13
pkgrel=1
pkgdesc="Hat JSON library"
url="https://github.com/hat-open/hat-json"
license=('Apache')
arch=('any')
depends=('python-hat-util' 'python-jsonpatch' 'python-jsonschema'
         'python-yaml' 'python-tomli' 'python-tomli-w')
makedepends=('python-hat-doit' 'python-installer')
source=("https://github.com/hat-open/hat-json/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d0af187fbdb2f53584d91ba213c3f2a46907e9ba5ed9edd63ae1d5248f438c47')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m doit
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" build/py/dist/*.whl
    install -D -m 644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
