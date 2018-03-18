# Maintainer: hexchain <i at hexchain dot org>

pkgname=tpm2-tss
pkgver=1.4.0
pkgrel=1
pkgdesc="TPM (Trusted Platform Module) 2.0 Software Stack (TSS)"
arch=('i686' 'x86_64')
url="https://github.com/tpm2-software/tpm2-tss"
license=('custom')
makedepends=('cmocka' 'autoconf-archive')
depends=('gcc-libs')
source=("https://github.com/tpm2-software/tpm2-tss/releases/download/$pkgver/tpm2-tss-$pkgver.tar.gz")
sha256sums=('cf8784cc536be16e6fba47f77033e093a6aeaed8420877ac9f42f77fb7b09031')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./configure --prefix=/usr --sbindir=/usr/bin --disable-static --with-pic
    make
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    make -k check
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
