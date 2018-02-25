# Maintainer: hexchain <i at hexchain dot org>

pkgname=tpm2-tss
pkgver=1.3.0
_gitname=$pkgname
pkgrel=2
pkgdesc="TPM (Trusted Platform Module) 2.0 Software Stack (TSS)"
arch=('i686' 'x86_64')
url="https://github.com/tpm2-software/tpm2-tss"
license=('custom')
makedepends=('git' 'cmocka' 'autoconf-archive')
depends=('gcc-libs')
source=("git+$url.git#tag=$pkgver")
md5sums=('SKIP')

build() {
    cd "$srcdir/$_gitname"
    ./bootstrap
    ./configure --prefix=/usr --sbindir=/usr/bin --disable-static --with-pic
    make
}

check() {
    cd "$srcdir/$_gitname"
    make -k check
}

package() {
    cd "$srcdir/$_gitname"
    make DESTDIR="$pkgdir/" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
