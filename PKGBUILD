# Maintainer: fk29g <fk29g.uphill912@slmails.com>
pkgname=treegen
pkgver=1.1.0
pkgrel=1
pkgdesc="ASCII Tree Directory and File Structure Generator"
arch=("x86_64")
url="https://github.com/bilbilak/treegen"
license=("GPL-3.0-only")
makedepends=("go")
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "fix-version.patch")
sha256sums=('1e167982687eeaaff59db64200941a534426ed6a28532173c0215a857f0f6f36'
            'cdd29cb2146c797debfb861fac5321d1615a13e631860548cd35c47d7a4b83ac')

prepare() {
    cd "$pkgname-$pkgver"
    patch -p1 < "$srcdir/fix-version.patch"
}

build() {
    cd "$pkgname-$pkgver"
    go build
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm 0755 $pkgname "$pkgdir/usr/bin/$pkgname"
    install -Dm 0644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
