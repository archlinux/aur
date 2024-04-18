# Maintainer: Popolon <popolon@popoplon.org>

pkgname=snac2
pkgver=2.51
pkgrel=2
pkgdesc='A simple, minimalistic ActivityPub instance'
arch=('x86_64' 'armv7h' 'aarch64' 'riscv32' 'riscv64')
url='https://codeberg.org/grunfink/snac2'
license=('MIT')
depends=('openssl' 'curl')
source=("https://codeberg.org/grunfink/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('c1c755ab91999b34f5ffe7606796ca1ad8453b439aadf457611642c73c653e41d6bf4462185673aa991d3ec1be1f10da80b077d0384bb7a0e5571aa98e90461e')

prepare() {
   sed -i 's/\/local//g' ${pkgname}/Makefile
}

build() {
    cd ${pkgname}
    make
}
package() {
    cd ${pkgname}
    install -Dm755 snac ${pkgdir}/usr/bin/snac
    install -Dm644 doc/snac.1 ${pkgdir}/usr/man/man1/snac.1
    install -Dm644 doc/snac.5 ${pkgdir}/usr/man/man5/snac.5
    install -Dm644 doc/snac.8 ${pkgdir}/usr/man/man8/snac.8

    install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
