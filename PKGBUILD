# Maintainer: Shatur95 <genaloner@gmail.com>

pkgname=vim-language-server
pkgver=1.4.2
pkgrel=1
pkgdesc="Vim language server"
arch=("x86_64")
url="https://github.com/iamcco/vim-language-server"
license=("Custom")
depends=("nodejs")
makedepends=("yarn")
source=($pkgname-$pkgver.tar.gz::"$url/archive/v$pkgver.tar.gz")
sha256sums=("2872e18e3a9d662627ecf2b75e8ea11adade26c576896ac4b4a9dc66c2731c0d")

build() {
    cd "$srcdir/$pkgname-$pkgver"
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
