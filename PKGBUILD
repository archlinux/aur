# Contributor: Edmund Lodewijks <e.lodewijks@gmail.com>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=libstroke
pkgver=0.5.1
pkgrel=11
pkgdesc="A stroke (mouse gesture) translation library"
arch=('i486' 'i686' 'pentium4' 'x86_64')
url="https://sources.archlinux.org/other/packages/libstroke/"
license=('GPL-2.0-only')
depends=('glibc')
makedepends=('libx11')
source=( # http://etla.net/libstroke/${pkgname}-${pkgver}.tar.gz
        $url/$pkgname-$pkgver.tar.gz
        libgstroke-Makefile.am.patch libstroke-Makefile.am.patch
        libstroke-0.5.1-m4_syntax.patch libstroke-0.5.1-no_gtk1.patch
	libstroke-0.5.1-stroke-c-string-header.patch)
sha1sums=('48bd2b98faa8681ccd97eda7a09442845dbf1b7b'
          'a0c3bd9e894650475ba3049b0ef3d7f9580c203d'
          'ee5a3635c31dba00b070a942c512cc0d53056188'
          'c9240937776b0572e3927e1c56d78309413c5209'
          'c79acd9712fa5c6b9a9ac21621c6858ec10d84dd'
          'a3c98f2d1a2a6bff392eb7e075c910d42d12fa3b')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -p1 -i "${srcdir}/libgstroke-Makefile.am.patch"
  patch -p1 -i "${srcdir}/libstroke-Makefile.am.patch"
  patch -p1 -i "${srcdir}/libstroke-0.5.1-m4_syntax.patch"
  patch -p1 -i "${srcdir}/libstroke-0.5.1-no_gtk1.patch"
  patch -p1 -i "${srcdir}/libstroke-0.5.1-stroke-c-string-header.patch"
}

build() {
  cd ${pkgname}-${pkgver}
  autoreconf --force --install
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
