# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=mod_fcgid
pkgver=2.3.9
pkgrel=5
pkgdesc="A FastCGI module for Apache HTTP Server."
license=('APACHE')
arch=('x86_64')
url="https://httpd.apache.org/mod_fcgid/"
depends=('apache')
source=(https://www.apache.org/dist/httpd/mod_fcgid/mod_fcgid-$pkgver.tar.bz2{,.asc}
30_fix-bts-691929.patch
large-file-upload.patch)
sha1sums=('f0b6d87dfcfe18b318905a3f91274051f3f17945'
          'SKIP'
          '661a16c15ba413cc841ef6ae0534a12eaee1b703'
          'b281882ff13028a4c3d0c2189263eea12e1189df')
validpgpkeys=('5B5181C2C0AB13E59DA3F7A3EC582EB639FF092C') # Jeff Trawick (CODE SIGNING KEY) <trawick@apache.org>

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -i ../30_fix-bts-691929.patch
  patch -Np0 -i ../large-file-upload.patch
}

build() {
  cd $pkgname-$pkgver
  ./configure.apxs 
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  rm -rf "${pkgdir}/usr/share"
  rm -rf "${pkgdir}/etc"
}
