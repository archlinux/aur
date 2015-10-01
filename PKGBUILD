# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: josephgbr <rafael.f.f1 at gmail.com>

pkgname=lib32-libidl2
pkgver=0.8.14
pkgrel=3
pkgdesc="A front-end for CORBA 2.2 IDL and Netscape's XPIDL (32 bit)"
arch=('x86_64')
url="http://www.gnome.org/"
license=('LGPL')
depends=('lib32-glib2' 'texinfo' 'libidl2')
makedepends=('gcc-multilib')
source=("http://ftp.gnome.org/pub/gnome/sources/libIDL/0.8/libIDL-$pkgver.tar.bz2")
sha256sums=('c5d24d8c096546353fbc7cedf208392d5a02afe9d56ebcc1cccb258d7c4d2220')
options=('!libtool' '!emptydirs')

build() {
  cd libIDL-$pkgver

  ./configure --prefix=/usr --libdir=/usr/lib32 CC='gcc -m32'
  make
}

package() {
  cd libIDL-$pkgver

  make DESTDIR="$pkgdir/" install

  # cleanup
  rm -rf "$pkgdir"/usr/{bin,include,share}
  # link license
  install -d "$pkgdir"/usr/share/licenses
  ln -s libidl2 "$pkgdir"/usr/share/licenses/libidl2
}
