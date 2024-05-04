# Maintainer: Bozo Kopic <bozo@kopic.xyz>

pkgname=hat-syslog
pkgver=0.7.15
pkgrel=2
pkgdesc="Syslog server and clients"
url="https://github.com/hat-open/hat-syslog"
license=('Apache')
arch=('any')
depends=('python-appdirs' 'python-hat-aio' 'python-hat-json'
         'python-hat-juggler' 'python-hat-util' 'python-sphinxcontrib-plantuml'
         'python-sphinxcontrib-programoutput')
makedepends=('python-build' 'python-hat-doit' 'python-installer' 'npm')
source=("https://github.com/hat-open/hat-syslog/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7773429edae4a0cb2136884f5fbe5a7aaf4d765fa4f9cba00e1d9708853aaa7f')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m 644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
