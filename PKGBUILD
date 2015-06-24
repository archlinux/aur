# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Michael P <ptchinster@archlinux.us>
# Contributor: Aaron Griffin <aaron@archlinux.org> 
# Contributor: Elmo Todurov <todurov@gmail.com>
# Contributor: Alexander De Sousa <archaur.xandy21@spamgourmet.com>

pkgname=scanmem
pkgver=0.15.2
pkgrel=1
pkgdesc="Memory scanner designed to isolate the address of an arbitrary variable in an executing process"
url="https://github.com/scanmem/scanmem"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('pygtk' 'python-gobject' 'polkit')
makedepends=('intltool')
install=scanmem.install
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz)
sha512sums=('9d1211b10b30962e35821895d7dd7d5a179e64b3f539b6dd2585a3f6b0ade7cd092fe377454b2582ec66e2c7a7676f8c7f04e8aff5c9e6e449a9eb6fb0498501')

build() {
  cd ${pkgname}-${pkgver}
  ./autogen.sh
  ./configure --enable-gui --prefix=/usr
  make
  (cd gui
    python -m compileall .
    python -O -m compileall .
  )
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -d "${pkgdir}/usr/share/gameconqueror/__pycache__"
  install gui/__pycache__/* -t "${pkgdir}/usr/share/gameconqueror/__pycache__"
}

# vim: ts=2 sw=2 et:
