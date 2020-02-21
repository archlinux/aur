# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=dovecot-xaps-plugin
pkgver=0.8
pkgrel=1
pkgdesc='iOS Push Email for Dovecot - dovecot plugin'
arch=('x86_64')
url='https://github.com/st3fan/dovecot-xaps-plugin'
license=('MIT')
depends=('dovecot' 'dovecot-xaps-daemon')
makedepends=('git' 'cmake')
conflicts=('dovecot-xaps-plugin-git')
source=("https://github.com/st3fan/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('0e0456a4acf2a0c00e3b5400ae0b4a3e3829e424f4e2fe8c72ef5cf0f3e63a4b0da73bdbc686b4f00efd0a1532d74b6fb248a0a878d74198369ffebe6b5a7162')

build() {
  mkdir -p ${pkgname}-${pkgver}/build
  cd ${pkgname}-${pkgver}/build
  cmake .. -DCMAKE_BUILD_TYPE=Release
}

package() {
  cd ${pkgname}-${pkgver}/build
  make DESTDIR="${pkgdir}" install
  install -Dm644 "${srcdir}"/${pkgname}-${pkgver}/xaps.conf "${pkgdir}"/usr/share/doc/dovecot/example-config/conf.d/30-xaps.conf
}
