# Maintainer: Ferrillo Lorenzo

pkgname=ephoto
pkgver=1.5
pkgrel=2
pkgdesc="Ephoto: Image viewer based on EFL"
arch=('i686' 'x86_64')
url="https://www.enlightenment.org/"
license=('BSD')
depends=('efl')
conflicts=('ephoto-git')
provides=('ephoto')
source=("http://download.enlightenment.org/rel/apps/${pkgname}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('fed33ae0ff594596d3925687d988e8ea7b629852f81ed611d059a62b974afbe0')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  install -d "${pkgdir}/usr/share/doc/${pkgname}/"
  install -m644 -t "${pkgdir}/usr/share/doc/${pkgname}/" "ChangeLog" "NEWS" "README"

  install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" "AUTHORS" "COPYING"
}
