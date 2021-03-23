# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=dovecot-xaps-plugin
pkgver=1.0
pkgrel=1
pkgdesc='iOS Push Email for Dovecot - dovecot plugin'
arch=('x86_64')
url='https://github.com/freswa/dovecot-xaps-plugin'
license=('custom:MIT')
depends=('dovecot' 'dovecot-xaps-daemon')
makedepends=('cmake')
source=("https://github.com/freswa/${pkgname}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
b2sums=('15fc1d5461c9c02a9d0f2d77618a7b94be6eebdcf4536b9ef2d0f09bc76c91665cff0a7d5bd603b74a3c73241199836cd9be04ae38ed959b0b83a47ab53371c3')

build() {
  cd ${pkgname}-${pkgver}
  cmake -B build -DCMAKE_BUILD_TYPE=Release
  make -C build
}

package() {
  cd ${pkgname}-${pkgver}/build
  make DESTDIR="${pkgdir}" install
  install -Dm644 "${srcdir}"/${pkgname}-${pkgver}/xaps.conf "${pkgdir}"/usr/share/doc/dovecot/example-config/conf.d/30-xaps.conf
  install -Dm644 -t "${pkgdir}"/usr/share/licenses/${pkgname}/ "${srcdir}"/${pkgname}-${pkgver}/LICENSE
}
