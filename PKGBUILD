# Maintainer: Bozo Kopic <bozo@kopic.xyz>

pkgname=hat-syslog
pkgver=0.7.5
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
sha256sums=('8d762b2e5fae0b4496024b4afc7386d053684f946aad98207e159e578237ae30')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m doit
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" build/py/dist/*.whl
    install -D -m 644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
