# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>

pkgname=libquvi
pkgver=0.9.4
pkgrel=4
pkgdesc='Library for parsing video download links.'
arch=('x86_64')
url='http://quvi.sourceforge.net/'
license=('AGPL3')
depends=('libquvi-scripts' 'curl' 'lua52' 'libproxy' 'libgcrypt' 'glib2')
conflicts=('quvi<0.9.0')
source=("https://downloads.sourceforge.net/sourceforge/quvi/${pkgname}-${pkgver}.tar.xz"{,.sig})
md5sums=('8e3f2134a6b3376934bd884b07dcdac5'
         'SKIP')
validpgpkeys=('E220FCFF9EADBA326FD6B23BBF1D59CCAD00BE50')

prepare() {
  cd "${pkgname}-${pkgver}"
  sed -i 's/lua51/lua52/g' configure.ac
  autoreconf -fvi
}

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
