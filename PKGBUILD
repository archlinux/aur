# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=dovecot-xaps-plugin-git
_gitname=dovecot-xaps-plugin
pkgver=22.92c51b5
pkgrel=1
pkgdesc='iOS Push Email for Dovecot - dovecot plugin'
arch=('any')
url='https://github.com/st3fan/dovecot-xaps-plugin'
license=('MIT')
depends=('dovecot' 'dovecot-xaps-daemon-git')
makedepends=('git')
source=(git+https://github.com/st3fan/dovecot-xaps-plugin.git)
sha512sums=('SKIP')

pkgver() {
  cd ${_gitname}
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "${srcdir}/${_gitname}"
  make
}

package() {
  install -Dm644 -t "${pkgdir}/usr/lib/dovecot/modules/" "${srcdir}/${_gitname}/imap_xaps_plugin.so" 
  install -Dm644 -t "${pkgdir}/usr/lib/dovecot/modules/" "${srcdir}/${_gitname}/xaps_plugin.so" 
  install -Dm644 "${srcdir}/${_gitname}/xaps.conf" "${pkgdir}/usr/share/doc/dovecot/example-config/conf.d/30-xaps.conf"
}
