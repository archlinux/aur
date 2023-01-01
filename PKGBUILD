# Maintainer: Bozo Kopic <bozo@kopic.xyz>

pkgname=opcut
pkgver=0.4.7
pkgrel=1
pkgdesc="Cutting stock problem optimizer"
url="https://github.com/bozokopic/opcut"
license=('GPL3')
arch=('any')
depends=('python-aiohttp' 'python-hat-aio' 'python-hat-json' 'python-cairo')
makedepends=('python-hat-doit' 'python-installer' 'yarn')
source=("https://github.com/bozokopic/opcut/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('772191f7ca5995c205a15f3218b7d305a422f65888b1e16dbb3cf1b6f0b8547d')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    SKIP_CROSS_COMPILE=1 python -m doit
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" build/py/dist/*.whl
    install -D -m 644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
