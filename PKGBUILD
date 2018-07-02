# Maintainer: hexchain <i at hexchain dot org>

pkgname=tpm2-tss
pkgver=2.0.0
pkgrel=1
pkgdesc="TPM (Trusted Platform Module) 2.0 Software Stack (TSS)"
arch=('i686' 'x86_64')
url="https://github.com/tpm2-software/tpm2-tss"
license=('custom')
makedepends=('cmocka' 'autoconf-archive')
depends=('gcc-libs')
source=("https://github.com/tpm2-software/tpm2-tss/releases/download/$pkgver/tpm2-tss-$pkgver.tar.gz")
sha256sums=('7dfd05f7d2c4d5339d1c9ecbdba25f4ea6df70e96b09928e15e0560cce02d525')

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
