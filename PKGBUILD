# Maintainer: Jikstra <jikstra@disroot.org>
pkgname=rpgp-git
pkgdesc="Pure rust implementation of OpenPGP "
pkgver=0.2.1
pkgrel=1
_gittag="${pkgver}"
arch=('any')
url="https://github.com/deltachat/deltachat-desktop"
license=('APACHE' 'MIT')
depends=('gcc-libs')
makedepends=('rustup' 'git')

prepare() {
    cd "$srcdir"
    git clone --branch $_gittag --depth 1 https://github.com/rpgp/rpgp.git $pkgname
}

build() {
    cd "$pkgname/pgp-ffi"
    echo "Active rust toolchain: $(rustup show active-toolchain)"
    make
}

package() {
    cd "$srcdir/${pkgname}"

    install -d "${pkgdir}/usr/lib/"
    install -m 644 "target/release/libpgp_ffi.so" "${pkgdir}/usr/lib/librpgp.so"
    install -d "${pkgdir}/usr/include/"
    install -m 644 "pgp-ffi/librpgp.h" "${pkgdir}/usr/include/"
    install -d "${pkgdir}/usr/lib/pkgconfig"
    install -m 644 "target/release/pkgconfig/rpgp.pc" "${pkgdir}/usr/lib/pkgconfig"
}
 
