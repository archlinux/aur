# Maintainer: Alexander Minges <alexander.minges@gmail.com>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Former Maintainer: Jan de Groot <jgc@archlinux.org>
# Current Contributor: Patrick McCarty <pnorcks at gmail dot com>

pkgname=guile1.8-gtk
_pkgname=guile-gtk
pkgver=2.1
pkgrel=5
pkgdesc="Guile (Scheme) bindings for GTK+"
arch=('i686' 'x86_64')
url="http://www.nongnu.org/guile-gtk/"
license=('GPL')
depends=('guile1.8>=1.8.1' 'gtk2' 'gtkglarea' 'libglade')
options=('!makeflags')
source=(ftp://ftp.gnu.org/gnu/${_pkgname}/${_pkgname}-${pkgver}.tar.gz deprecated.patch
        brokentest.patch
        g-object-ref.diff
        prll-install.patch
        guile1.8.patch)
md5sums=('4ed9b00f4cefdef412923270d8ad02a5'
         'f1e28215b95c0bf10eacd8dacb6f2d55'
         'edfde0720a7b2f70f2d15aaca72dc704'
         '191a9979bf975c30169247ab685cabc8'
         'be846cdb7eac97495b4fa6ae23a624d1'
         '7d70c49c4f0565b270863038ab9f5919')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  patch -Np1 -i ../deprecated.patch
  patch -Np1 -i ../brokentest.patch
  patch -Np1 -i ../prll-install.patch
  patch -Np1 -i ../guile1.8.patch
  
  #aclocal
  # libtoolize --automake --copy
  #autoconf
  #automake --copy --add-missing --gnu
  
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
