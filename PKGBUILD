# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=dovecot-xaps-plugin-git
_gitname=dovecot-xaps-plugin
pkgver=44.6a135f3
pkgrel=1
pkgdesc='iOS Push Email for Dovecot - dovecot plugin'
arch=('any')
url='https://github.com/st3fan/dovecot-xaps-plugin'
license=('MIT')
depends=('dovecot' 'dovecot-xaps-daemon-git')
makedepends=('git' 'cmake')
source=(git+https://github.com/st3fan/dovecot-xaps-plugin.git)
sha512sums=('SKIP')

pkgver() {
  cd ${_gitname}
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  mkdir -p "${srcdir}/${_gitname}/build"
  cd "${srcdir}/${_gitname}/build"
  cmake .. -DCMAKE_BUILD_TYPE=Release
}

package() {
  cd "${srcdir}/${_gitname}/build"
  make DESTDIR="${pkgdir}" install
  install -Dm644 "${srcdir}/${_gitname}/xaps.conf" "${pkgdir}/usr/share/doc/dovecot/example-config/conf.d/30-xaps.conf"

}
