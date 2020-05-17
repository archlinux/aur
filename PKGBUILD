# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=dovecot-xaps-plugin
pkgver=0.8
pkgrel=2
pkgdesc='iOS Push Email for Dovecot - dovecot plugin'
arch=('x86_64')
url='https://github.com/st3fan/dovecot-xaps-plugin'
license=('custom:MIT')
depends=('dovecot' 'dovecot-xaps-daemon')
makedepends=('cmake')
source=("https://github.com/st3fan/${pkgname}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
b2sums=('1b2483d8de3b47672e5b78ea83865c8282459aaa9d40a16ca1238761766dd59e2c94c760dab26c3f213b85c5f80b02bc2c867add37e951b92c6619aeb6c5687e')

prepare() {
  cd ${pkgname}-${pkgver}
  cmake -B build -DCMAKE_BUILD_TYPE=Release
}

build() {
  cd ${pkgname}-${pkgver}/build
  make
}

package() {
  cd ${pkgname}-${pkgver}/build
  make DESTDIR="${pkgdir}" install
  install -Dm644 "${srcdir}"/${pkgname}-${pkgver}/xaps.conf "${pkgdir}"/usr/share/doc/dovecot/example-config/conf.d/30-xaps.conf
  install -Dm644 -t "${pkgdir}"/usr/share/licenses/${pkgname}/ "${srcdir}"/${pkgname}-${pkgver}/LICENSE
}
