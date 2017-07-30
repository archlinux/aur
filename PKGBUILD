# Maintainer: hexchain <i at hexchain dot org>

pkgname=tpm2-tss
pkgver=1.1.0
_gitname=TPM2.0-TSS
pkgrel=1
pkgdesc="TPM (Trusted Platform Module) 2.0 Software Stack (TSS)"
arch=('i686' 'x86_64')
url="https://github.com/01org/TPM2.0-TSS"
license=('custom')
makedepends=('git' 'cmocka' 'autoconf-archive')
depends=('gcc-libs')
source=("git+$url.git#tag=$pkgver")
md5sums=('SKIP')

build() {
    cd "$srcdir/$_gitname"
    ./bootstrap
    ./configure --prefix=/usr --sbindir=/usr/bin --disable-static
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
