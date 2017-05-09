# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=dovecot-xaps-plugin
pkgver=0.1
pkgrel=1
pkgdesc='iOS Push Email for Dovecot - dovecot plugin'
arch=('any')
url='https://github.com/st3fan/dovecot-xaps-plugin'
license=('MIT')
depends=('dovecot' 'dovecot-xaps-daemon')
source=(https://github.com/st3fan/${pkgname}/archive/v${pkgver}.tar.gz)
sha512sums=('838c7e77d5d7405f40ce6417ba600e640bd700ec28fbd2056adcc7612535f79bcea1fe15b5a85c702c8ea4000a8a213974ffda8d98bdb4a87979a64fcc8e9aff')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  install -Dm644 -t "${pkgdir}/usr/lib/dovecot/modules/" "${srcdir}/${pkgname}-${pkgver}/imap_xaps_plugin.so"
  install -Dm644 -t "${pkgdir}/usr/lib/dovecot/modules/" "${srcdir}/${pkgname}-${pkgver}/xaps_plugin.so"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/xaps.conf" "${pkgdir}/usr/share/doc/dovecot/example-config/conf.d/30-xaps.conf"
}
