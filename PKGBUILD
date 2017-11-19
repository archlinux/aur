# Maintainer: Hexchain Tong <i at hexchain dot org>

pkgname=tpm2-tools
pkgver=2.1.1
pkgrel=2
pkgdesc="TPM (Trusted Platform Module) 2.0 tools based on TPM2.0-TSS"
arch=('i686' 'x86_64')
url="https://github.com/01org/tpm2.0-tools"
license=('BSD')
makedepends=('git' 'autoconf-archive')
depends=('tpm2-abrmd')
source=("$pkgname::git+https://github.com/01org/tpm2-tools.git#tag=$pkgver")
md5sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    ./bootstrap
    ./configure \
        --prefix=/usr --sbindir=/usr/bin --disable-static --with-pic
    make
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
