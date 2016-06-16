# Maintainer: Hexchain Tong <i at hexchain dot org>
pkgname=tpm2.0-tss-git
pkgver=r341.daeb5bb
_pkgname=TPM2.0-TSS
pkgrel=1
pkgdesc="TPM (Trusted Platform Module) 2.0 Software Stack (TSS)"
arch=('i686' 'x86_64')
url="https://github.com/01org/TPM2.0-TSS"
license=('custom')
makedepends=('git' 'cmocka' 'autoconf-archive')
depends=('gcc-libs')
source=('git+https://github.com/01org/TPM2.0-TSS.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"
    ./bootstrap
    ./configure --prefix=/usr --sbindir=/usr/bin --disable-static
    make
}

check() {
    cd "$srcdir/$_pkgname"
    make -k check
}

package() {
    cd "$srcdir/$_pkgname"
    make DESTDIR="$pkgdir/" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
