# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=dovecot-xaps-plugin
pkgver=0.3
pkgrel=1
pkgdesc='iOS Push Email for Dovecot - dovecot plugin'
arch=('any')
url='https://github.com/st3fan/dovecot-xaps-plugin'
license=('MIT')
depends=('dovecot' 'dovecot-xaps-daemon')
makedepends=('git' 'cmake')
conflicts=('dovecot-xaps-plugin-git')
source=(https://github.com/st3fan/${pkgname}/archive/v${pkgver}.tar.gz)
sha512sums=('6b88edd495cf0710a074f2eeb7bbd826160167dd940e54831e9cc7842ceabe0a0de469d333410706a00e91397541fc8680819213e6de5dca87c28a64c7e457c1')

build() {
    mkdir -p "${srcdir}/${pkgname}-${pkgver}/build"
    cd "${srcdir}/${pkgname}-${pkgver}/build"
    cmake .. -DCMAKE_BUILD_TYPE=Release
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/build"
    make DESTDIR="${pkgdir}" install
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/xaps.conf" "${pkgdir}/usr/share/doc/dovecot/example-config/conf.d/30-xaps.conf"
}
