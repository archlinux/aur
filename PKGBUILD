# Maintainer: Victor Schulz <schulz89@gmail.com>
pkgname=uvm-systemc
pkgver=1.0_beta1
pkgrel=1
pkgdesc="Universal Verification Methodology (UVM) in SystemC"
arch=('x86_64' 'i686')
url="http://www.accellera.org/activities/working-groups/systemc-verification/uvm-systemc-faq"
license=('Apache License Version 2.0, January 2004')
depends=('systemc')
provides=('uvm-systemc')
source=("http://accellera.org/images/downloads/standards/systemc/$pkgname-${pkgver/_/-}.tar.gz")
md5sums=('d8380982c948d78f9481486c45084988')

build() {
    cd "$srcdir/$pkgname-${pkgver/_/-}"
    config/bootstrap
    mkdir -p objdir
    cd objdir
    ../configure --prefix=/usr --with-systemc=/usr --with-arch-suffix="" --with-layout=unix
    make
}

package() {
    cd "$srcdir/$pkgname-${pkgver/_/-}/objdir"
    make DESTDIR="$pkgdir/" install
    cd ..
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
