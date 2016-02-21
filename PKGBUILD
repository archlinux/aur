# Maintainer: Hexchain Tong <i at hexchain dot org>
pkgname=tpm2.0-tools-git
_pkgname=tpm2.0-tools
pkgver=r45.10a1fe9
pkgrel=1
pkgdesc="TPM (Trusted Platform Module) 2.0 tools based on TPM2.0-TSS"
arch=('i686' 'x86_64')
url="https://github.com/01org/tpm2.0-tools"
license=('custom')
provides=('tpm2.0-tools')
makedepends=('git')
depends=('tpm2.0-tss-git')
source=('git+https://github.com/01org/tpm2.0-tools.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"
    ./bootstrap
    mkdir -p "$srcdir/build"
    cd "$srcdir/build"
    "../$_pkgname/configure" --prefix=/usr --sbindir=/usr/bin --disable-static
    make
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    cd "$srcdir/build"
    make DESTDIR="$pkgdir" install
}
