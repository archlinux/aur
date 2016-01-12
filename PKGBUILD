# Maintainer: Alexander Minges <alexander.minges@gmail.com>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Former Maintainer: Jan de Groot <jgc@archlinux.org>
# Current Contributor: Patrick McCarty <pnorcks at gmail dot com>

pkgname=guile-gtk
pkgver=2.1
pkgrel=2
pkgdesc="Guile (Scheme) bindings for GTK+"
arch=('i686' 'x86_64')
url="http://www.nongnu.org/guile-gtk/"
license=('GPL')
depends=('guile>=1.8.1' 'gtk2' 'gtkglarea')
options=('!makeflags')
source=(ftp://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.gz deprecated.patch
        brokentest.patch
        g-object-ref.diff
        prll-install.patch)
md5sums=('4ed9b00f4cefdef412923270d8ad02a5'
         'f1e28215b95c0bf10eacd8dacb6f2d55'
         'edfde0720a7b2f70f2d15aaca72dc704'
         '191a9979bf975c30169247ab685cabc8'
         'be846cdb7eac97495b4fa6ae23a624d1')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  patch -Np1 -i ../deprecated.patch
  patch -Np1 -i ../brokentest.patch
  patch -Np1 -i ../prll-install.patch
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
