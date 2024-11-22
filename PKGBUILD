# Maintainer: Popolon <popolon@popoplon.org>

pkgname=snac2
pkgver=2.63
pkgrel=1
pkgdesc='A simple, minimalistic ActivityPub instance'
arch=('x86_64' 'armv7h' 'aarch64' 'riscv32' 'riscv64')
url='https://codeberg.org/grunfink/snac2'
license=('MIT')
depends=('openssl' 'curl')
source=("https://codeberg.org/grunfink/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('23aebff6261872e3ffb5ce0a5b55d0f1f032e55b435f0ae2350cbb7e4a82b278d2d0f8a37b354ad1adaa6db09f29ef725dfd740b6b4218c2aa3e6239720089a8')

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
