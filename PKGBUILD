# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>

pkgname=libquvi
pkgver=0.9.4
pkgrel=7
pkgdesc='Library for parsing video download links.'
arch=('x86_64')
url='http://quvi.sourceforge.net/'
license=('AGPL3')
depends=('libquvi-scripts' 'curl' 'lua52' 'libproxy' 'libgcrypt' 'glib2')
conflicts=('quvi<0.9.0')
source=("https://downloads.sourceforge.net/sourceforge/quvi/${pkgname}-${pkgver}.tar.xz"{,.sig} reproducible-date.patch)
sha512sums=('287015e370e7b7f98f0f4c3717f5b044c8fcfb8b823c7988cd248e56b5fbbfa1a1aa421fbdafb38d727b79495267ccd4dead71587052117db53f29236268b651'
            'SKIP'
            '0636da3c9cebb0a7c6f09198bc40a9781a84cedeff03566e6d6d3382de45296d9f517989a858bce67b34105091c4855f6463713ddf1dc867db1e14bb51b8709f')
validpgpkeys=('E220FCFF9EADBA326FD6B23BBF1D59CCAD00BE50')

prepare() {
  cd "${pkgname}-${pkgver}"
  sed -i 's/lua51/lua52/g' configure.ac
  patch -Np1 -i ${srcdir}/reproducible-date.patch
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
