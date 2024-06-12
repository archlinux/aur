# Maintainer: Popolon <popolon@popoplon.org>

pkgname=snac2
pkgver=2.55
pkgrel=1
pkgdesc='A simple, minimalistic ActivityPub instance'
arch=('x86_64' 'armv7h' 'aarch64' 'riscv32' 'riscv64')
url='https://codeberg.org/grunfink/snac2'
license=('MIT')
depends=('openssl' 'curl')
source=("https://codeberg.org/grunfink/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('f1c15a2118dd083368681d506ec1828051e8b8388c0b2a6f4cd99508a9a1338a4e459adb30cb45dae1b1248bd6a10f296510a4fcbcf0a64950cccc79f9e27749')

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
