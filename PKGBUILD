# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=dovecot-xaps-plugin-git
_gitname=dovecot-xaps-plugin
pkgver=69.3d1c71e
pkgrel=1
pkgdesc='iOS Push Email for Dovecot - dovecot plugin'
arch=('any')
url='https://github.com/st3fan/dovecot-xaps-plugin'
license=('MIT')
depends=('dovecot' 'dovecot-xaps-daemon')
makedepends=('git' 'cmake')
source=("git+https://github.com/st3fan/dovecot-xaps-plugin.git")
b2sums=('SKIP')

pkgver() {
  cd ${_gitname}
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  mkdir -p ${_gitname}/build
  cd ${_gitname}/build
  cmake .. -DCMAKE_BUILD_TYPE=Release
}

package() {
  cd ${_gitname}/build
  make DESTDIR="${pkgdir}" install
  install -Dm644 "${srcdir}"/${_gitname}/xaps.conf "${pkgdir}"/usr/share/doc/dovecot/example-config/conf.d/30-xaps.conf
}
