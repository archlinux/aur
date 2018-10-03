# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=dovecot-xaps-plugin
pkgver=0.7
pkgrel=1
pkgdesc='iOS Push Email for Dovecot - dovecot plugin'
arch=('any')
url='https://github.com/st3fan/dovecot-xaps-plugin'
license=('MIT')
depends=('dovecot' 'dovecot-xaps-daemon')
makedepends=('git' 'cmake')
conflicts=('dovecot-xaps-plugin-git')
source=(https://github.com/st3fan/${pkgname}/archive/v${pkgver}.tar.gz)
sha512sums=('0ffc11de24380d84d41378e89fbcc5a8796ee73f5a7f6603b4a587e44dffebc6047d402e25ba6c0189b79bbdf186e9d42d2926092e465b388262a4f35b3052b5')

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
