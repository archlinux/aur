# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Hugo Doria <hugo@archlinux.org>
# Contributor: Sarah Hay <sarah@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>

pkgname=faac
pkgver=1.30
pkgrel=2
pkgdesc="Freeware Advanced Audio Coder"
arch=('x86_64')
url="https://www.audiocoding.com/"
license=('GPL2' 'custom')
depends=('glibc')
provides=('libfaac.so')
source=("$pkgname-$pkgver.tar.gz::https://github.com/knik0/${pkgname}/archive/${pkgver/./_}.tar.gz")
sha512sums=('8582cd580dba2a347d15dc4fab42020d7120d0552c54ab74cfaf59ba1b270abb94c67e39d42459a14cbc6e98f3fd00cbda589e1b4f0c7278e41bdef6ae7b6554')

prepare() {
  mv -v "${pkgname}-${pkgver/./_}" "${pkgname}-${pkgver}"
  cd "${pkgname}-${pkgver}"
  autoreconf -vfi
}

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -vDm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -vDm 644 {AUTHORS,ChangeLog,NEWS,README,TODO} \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
