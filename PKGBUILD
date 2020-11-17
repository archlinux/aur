# Maintainer: audeoudh
#
# From purple-mattermost-git:
# Contributor: kaptoxic

pkgname=purple-mattermost
pkgver=1.2
pkgrel=1
pkgdesc="A libpurple/Pidgin plugin for Mattermost"
url='https://github.com/EionRobb/purple-mattermost'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('libpurple' 'json-glib' 'discount')
source=("${pkgname}.tar.gz::https://github.com/EionRobb/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('2484c68fcc3c57a176991c143346dc8cc6a0aaf37d5ecd0ff2c0ec201ca094ae')

build() {
    cd "${pkgname}-${pkgver}"
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
    # Fix icons access rights, see https://github.com/EionRobb/purple-mattermost/pull/132
    chmod 644 "${pkgdir}/usr/share/pixmaps/pidgin/protocols"/*/mattermost.png
}
