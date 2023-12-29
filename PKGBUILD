# Maintainer: Bozo Kopic <bozo@kopic.xyz>

pkgname=hat-syslog
pkgver=0.7.8
pkgrel=1
pkgdesc="Syslog server and clients"
url="https://github.com/hat-open/hat-syslog"
license=('Apache')
arch=('any')
depends=('python-appdirs' 'python-hat-aio' 'python-hat-json'
         'python-hat-juggler' 'python-hat-util')
makedepends=('python-build' 'python-hat-doit' 'python-installer' 'yarn')
source=("https://github.com/hat-open/hat-syslog/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9c9202e4c06f48c809c35a9f5703d046890248a264e7d08bd1515e33aba9b1d1')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m 644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
