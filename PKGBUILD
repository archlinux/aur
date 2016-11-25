# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=dovecot-xaps-plugin-git
_gitname=dovecot-xaps-plugin
pkgver=22.92c51b5
pkgrel=1
pkgdesc='iOS Push Email for Dovecot'
url='https://github.com/st3fan/dovecot-xaps-plugin'
arch=('any')
license=('MIT')
depends=('dovecot')
makedepends=('git')
source=("git+https://github.com/st3fan/dovecot-xaps-plugin.git")
sha512sums=('SKIP')
 
pkgver() {
  cd ${_gitname}
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd ${srcdir}/${_gitname}
  make
}

package() {
  install -d -m 755 ${pkgdir}/usr/lib/dovecot/modules/
  install -d -m 755 ${pkgdir}/usr/share/doc/dovecot/example-config/conf.d/

  install -D -m 644 ${srcdir}/${_gitname}/imap_xaps_plugin.so ${pkgdir}/usr/lib/dovecot/modules/
  install -D -m 644 ${srcdir}/${_gitname}/xaps_plugin.so ${pkgdir}/usr/lib/dovecot/modules/

  install -D -m 644 ${srcdir}/${_gitname}/xaps.conf ${pkgdir}/usr/share/doc/dovecot/example-config/conf.d/30-xaps.conf
}
