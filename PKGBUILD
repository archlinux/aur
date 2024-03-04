# Maintainer: Dmitry Sokol <d.sokol@ireptu.film>
# Contributor: Victor Schulz <schulz89@gmail.com>

pkgname=uvm-systemc
pkgver=1.0_beta5
pkgrel=1
pkgdesc="Universal Verification Methodology (UVM) in SystemC"
arch=('x86_64' 'i686')
url="http://www.accellera.org/activities/working-groups/systemc-verification/uvm-systemc-faq"
license=('Apache License Version 2.0, January 2004')
depends=('systemc')
provides=('uvm-systemc')
source=(https://www.accellera.org/images/downloads/drafts-review/$pkgname-${pkgver/_/-}.tar.gz)

md5sums=('7374d29f173b57e41e52a2565fcc9efb')

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
