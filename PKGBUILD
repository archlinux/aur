# Maintainer: Christian Benitez <cbenitezdiaz@gmail.com>
pkgname=noir
pkgver=0.25.1 
pkgrel=1
pkgdesc="Attack surface detector that identifies endpoints by static analysis"
arch=('x86_64')
url="https://github.com/owasp-noir/noir"
license=('MIT')
depends=('gc' 'pcre2' 'libevent' 'libxml2')
makedepends=('crystal' 'shards' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/owasp-noir/noir/archive/v$pkgver.tar.gz")
sha256sums=('37861d7c498ddced48c4de6c06784f0dd5e9a733a12793064e1f3bcd40d77ca3')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    shards install --production
    shards build --release --no-debug
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 bin/noir "$pkgdir/usr/bin/noir"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
