# Maintainer: Nicolas F. <aur@fratti.ch>
pkgname="peg"
pkgver=0.1.18
pkgrel=1
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h' 'arm')
pkgdesc='recursive-descent parser generators for C'
url='http://piumarta.com/software/peg/'
license=('MIT')
source=("http://piumarta.com/software/peg/peg-${pkgver}.tar.gz"
        '0000-dont-strip.patch')
sha256sums=('20193bdd673fc7487a38937e297fff08aa73751b633a086ac28c3b34890f9084'
            'b5ca5f4028651990d30735db1093be08c5cc5d214fc0f73f3a7c7314906c1c1e')

prepare() {
    cd "$pkgname-$pkgver"
    patch -Np1 -i "${srcdir}/0000-dont-strip.patch"
}

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    make ROOT="${pkgdir}" PREFIX="/usr" MANDIR="${pkgdir}/usr/share/man/man1" install
}
