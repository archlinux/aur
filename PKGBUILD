# Maintainer: Bozo Kopic <bozo@kopic.xyz>

pkgname=opcut
pkgver=0.4.9
pkgrel=1
pkgdesc="Cutting stock problem optimizer"
url="https://github.com/bozokopic/opcut"
license=('GPL3')
arch=('x86_64' 'armv7l' 'aarch64')
depends=('python-aiohttp' 'python-hat-aio' 'python-hat-json' 'python-cairo')
makedepends=('python-hat-doit' 'python-installer' 'yarn')
source=("https://github.com/bozokopic/opcut/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('965303a6b69b5cfa5070abb8ae6d4a41e46148b987a3b0f658d997d8c580b20a')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    SKIP_CROSS_COMPILE=1 python -m doit
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" build/py/dist/*.whl
    install -D -m 644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
