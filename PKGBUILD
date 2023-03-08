# Maintainer: Bozo Kopic <bozo@kopic.xyz>

pkgname=hat-syslog
pkgver=0.6.2
pkgrel=1
pkgdesc="Syslog server and clients"
url="https://github.com/hat-open/hat-syslog"
license=('Apache')
arch=('any')
depends=('python-appdirs' 'python-hat-aio' 'python-hat-json'
         'python-hat-juggler' 'python-hat-util')
makedepends=('python-hat-doit' 'python-installer' 'yarn'
             'python-sphinxcontrib-plantuml' 'python-sphinxcontrib-programoutput')
source=("https://github.com/hat-open/hat-syslog/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5b79be110cc66d1ebd822b65c4c904bfeba172c84c3c858951543c154dcf967f')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m doit
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" build/py/dist/*.whl
    install -D -m 644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
