# Maintainer: Bozo Kopic <bozo@kopic.xyz>

_name=hat-json
pkgname=python-$_name
pkgver=0.5.21
pkgrel=1
pkgdesc="Hat JSON library"
url="https://github.com/hat-open/hat-json"
license=('Apache')
arch=('any')
depends=('python-hat-util' 'python-jsonpatch' 'python-jsonschema'
         'python-yaml' 'python-tomli' 'python-tomli-w')
makedepends=('python-build' 'python-hat-doit' 'python-installer')
source=("https://github.com/hat-open/hat-json/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9a416325b6bbef3d90d86193794e203373b2e365c209d51558430dd9c9164e7d')

build() {
    cd "$srcdir/$_name-$pkgver"
    sed -i -e 's/"jsonschema ~=4.17.3"/"jsonschema >=4.17.3"/' pyproject.toml
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m 644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
