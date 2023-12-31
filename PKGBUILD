# Maintainer: Bozo Kopic <bozo@kopic.xyz>

pkgname=opcut
pkgver=0.4.11
pkgrel=1
pkgdesc="Cutting stock problem optimizer"
url="https://github.com/bozokopic/opcut"
license=('GPL3')
arch=('x86_64' 'armv7l' 'aarch64')
depends=('python-aiohttp' 'python-hat-aio' 'python-hat-json' 'python-cairo')
makedepends=('python-build' 'python-hat-doit' 'python-installer' 'yarn')
source=("https://github.com/bozokopic/opcut/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0e6493610e0f3165cb0125f373ba26253848b4a4dbcb8e675ef285ef8f9f77b9')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m 644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
