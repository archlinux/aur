# Maintainer: Popolon <popolon@popoplon.org>

pkgname=snac2
pkgver=2.65
pkgrel=1
pkgdesc='A simple, minimalistic ActivityPub instance'
arch=('x86_64' 'armv7h' 'aarch64' 'riscv32' 'riscv64')
url='https://codeberg.org/grunfink/snac2'
license=('MIT')
depends=('openssl' 'curl')
source=("https://codeberg.org/grunfink/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('d330b983d1f7fff2641b707d1bdb920abf7aad0e7957d5367b3746706387cff2cf0236ec2fa6ec7be408af72ee607cf7bc3d098feccc62b13cbd31c812bc426b')

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
