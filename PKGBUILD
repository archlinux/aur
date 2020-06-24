# Maintainer: Shatur95 <genaloner@gmail.com>

pkgname=vim-language-server
pkgver=1.9.0
pkgrel=1
pkgdesc="Vim language server"
arch=(x86_64)
url="https://github.com/iamcco/vim-language-server"
license=(Custom)
depends=(nodejs)
makedepends=(yarn)
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha256sums=(b434b0a10cd22f1cb05ecc9d7b8b43ef0ed6bbcc9d124a425734269985c1037d)

build() {
    cd $pkgname-$pkgver
    yarn
    yarn build
}

package() {
    install -d "$pkgdir/usr/lib/$pkgname"
    cd "$pkgdir/usr/lib/$pkgname"
    cp -a "$srcdir/$pkgname-$pkgver/"{bin,out} .

    install -d "$pkgdir/usr/bin"
    ln -s "/usr/lib/$pkgname/bin/index.js" "$pkgdir/usr/bin/$pkgname"
}
