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
b2sums=('1b2483d8de3b47672e5b78ea83865c8282459aaa9d40a16ca1238761766dd59e2c94c760dab26c3f213b85c5f80b02bc2c867add37e951b92c6619aeb6c5687e')

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
