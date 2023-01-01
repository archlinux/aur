# Maintainer: Bozo Kopic <bozo@kopic.xyz>

_name=hat-util
pkgname=python-$_name
pkgver=0.6.7
pkgrel=1
pkgdesc="Hat utility library"
url="https://github.com/hat-open/hat-util"
license=('Apache')
arch=('any')
depends=('python')
makedepends=('python-hat-doit' 'python-installer')
source=("https://github.com/hat-open/hat-util/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d80a3c10f0336d588630bf3adf6de5360e848a0698bc6414923e94e5c4b8b3b9')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m doit build_py
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" build/py/dist/*.whl
    install -D -m 644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
