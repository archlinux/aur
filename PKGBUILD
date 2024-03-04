# Maintainer: Popolon <popolon@popoplon.org>

pkgname=snac2
pkgver=2.49
pkgrel=1
pkgdesc='A simple, minimalistic ActivityPub instance'
arch=('x86_64' 'armv7h' 'aarch64' 'riscv32' 'riscv64')
url='https://codeberg.org/grunfink/snac2'
license=('MIT')
depends=('openssl' 'curl')
source=("https://codeberg.org/grunfink/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('7798f9265d0c3bb38134d0ac4521b793ad60ca45e138d95db109b065827fd0dcc31dea3c09e78dd59e76f5b64f6e054efb34acabf2ff0e70d514136c2cd217df')

prepare() {
   sed -i 's/\/local//g' ${pkgname}/Makefile
}

build() {
    cd ${pkgname}
    make CFLAGS=-DNO_MASTODON_API
}
package() {
    cd ${pkgname}
    install -Dm755 snac ${pkgdir}/usr/bin/snac
    install -Dm644 doc/snac.1 ${pkgdir}/usr/man/man1/snac.1
    install -Dm644 doc/snac.5 ${pkgdir}/usr/man/man5/snac.5
    install -Dm644 doc/snac.8 ${pkgdir}/usr/man/man8/snac.8

    install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
