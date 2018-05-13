# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=dovecot-xaps-plugin
pkgver=0.5
pkgrel=1
pkgdesc='iOS Push Email for Dovecot - dovecot plugin'
arch=('any')
url='https://github.com/st3fan/dovecot-xaps-plugin'
license=('MIT')
depends=('dovecot' 'dovecot-xaps-daemon')
makedepends=('git' 'cmake')
conflicts=('dovecot-xaps-plugin-git')
source=(https://github.com/st3fan/${pkgname}/archive/v${pkgver}.tar.gz)
sha512sums=('8b808a3b7b0080cbdbdf67d52f085a5890d3ed0531c6eddb257967674506fd4502ef5e973ff08fbd9628d532876521e446bb1a03bd7e802a96bc67da377b4b6a')

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
