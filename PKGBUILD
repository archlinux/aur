# Maintainer: Roelof <roelof@example.com>
pkgname=cockpit-plakar
pkgver=0.1.0
pkgrel=1
pkgdesc="Cockpit plugin for managing Plakar backups"
arch=('any')
url="https://github.com/RiddermanR/cockpit-plakar"
license=('GPL3')
depends=('cockpit' 'plakar')
makedepends=('npm' 'nodejs' 'make')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c623f3b923a5b2b35d2bdf0fc2417b46f9f32ef8c34fe005491602e7d428dfc2')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    npm install --no-audit --no-fund --cache "$srcdir/.npm-cache"
    npm run build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make install DESTDIR="$pkgdir" PREFIX=/usr
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
