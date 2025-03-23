# Maintainer: Bozo Kopic <bozo@kopic.xyz>

pkgname=opcut
pkgver=0.4.16
pkgrel=1
pkgdesc="Cutting stock problem optimizer"
url="https://github.com/bozokopic/opcut"
license=('GPL3')
arch=('x86_64' 'armv7l' 'aarch64')
depends=('python-aiohttp' 'python-hat-aio' 'python-hat-json' 'python-cairo')
makedepends=('python-build' 'python-hat-doit' 'python-installer' 'npm')
source=("https://github.com/bozokopic/opcut/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ea304bb5f102090d8a04f9f23b27680938a71698a8cfff597f2194a53f3ae4c1')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m 644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
