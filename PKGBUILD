# Maintainer: Hexchain Tong <i at hexchain dot org>

pkgname=tpm2-tools
pkgver=3.0.2
pkgrel=1
pkgdesc="TPM (Trusted Platform Module) 2.0 tools based on TPM2.0-TSS"
arch=('x86_64')
url="https://github.com/intel/tpm2-tools"
license=('BSD')
makedepends=('git' 'autoconf-archive')
depends=('tpm2-abrmd' 'curl')
source=("git+$url.git#tag=$pkgver")
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
