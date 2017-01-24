# Maintainer: Gregor Reitzenstein <dean4devil at paranoidlabs.org>

pkgname=dovecot-libsodium-plugin
pkgver=1.0
pkgrel=1
pkgdesc='Dovecot libsodium plugin for Argon2 & SCRYPT hashing schemes'
url='https://github.com/LuckyFellow/dovecot-libsodium-plugin'
arch=('any')
license=('GPL3')
depends=('dovecot' 'libsodium')
makedepends=('git')
source=('git+https://github.com/LuckyFellow/dovecot-libsodium-plugin.git')
sha512sums=('SKIP')

build() {
    cd ${srcdir}/${pkgname}

    ./autogen.sh

    ./configure --prefix=/usr

    make
}

package() {
    install -d -m 755 ${pkgdir}/usr/lib/dovecot/modules/auth/

    install -D -m 644 ${srcdir}/${pkgname}/src/.libs/libsodium_plugin.so ${pkgdir}/usr/lib/dovecot/modules/auth/
}
