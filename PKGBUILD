# Maintainer: Bozo Kopic <bozo@kopic.xyz>

pkgname=opcut
pkgver=0.4.8
pkgrel=1
pkgdesc="Cutting stock problem optimizer"
url="https://github.com/bozokopic/opcut"
license=('GPL3')
arch=('x86_64' 'armv7l' 'aarch64')
depends=('python-aiohttp' 'python-hat-aio' 'python-hat-json' 'python-cairo')
makedepends=('python-hat-doit' 'python-installer' 'yarn')
source=("https://github.com/bozokopic/opcut/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d26303253186ad653da3dd897e7558de2eed963449180e1b258c08bef7533615')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    SKIP_CROSS_COMPILE=1 python -m doit
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" build/py/dist/*.whl
    install -D -m 644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
