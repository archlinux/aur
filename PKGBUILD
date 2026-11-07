# Maintainer: Kuan-Yen Chou <kuanyenchou at gmail dot com>

pkgname=python-pypacker
pkgver=6.0
pkgrel=2
pkgdesc="The fastest and simplest packet manipulation lib for Python"
arch=('x86_64')
url="https://gitlab.com/mike01/pypacker"
license=('GPL-2.0-only AND BSD-3-Clause')
depends=('python' 'python-netifaces')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("https://gitlab.com/mike01/pypacker/-/archive/v$pkgver/pypacker-v$pkgver.tar.gz")
sha256sums=('fecf72a52d4078c145c1fa07cfd650e33d415a0836a98147b7588d39eb769be0')

build() {
    cd "$srcdir/pypacker-v$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/pypacker-v$pkgver"
    python -m installer \
        --destdir="$pkgdir" \
        --prefix=/usr \
        --compile-bytecode=1 \
        dist/*.whl
    install -Dm 644 LICENSE_BSD -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: set ts=4 sw=4 et :
