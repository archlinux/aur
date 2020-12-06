# Maintainer: Chuan Liu <liuchuan@liuchuan.org>

pkgbase=libexplain
pkgname='libexplain'
pkgdesc='A library to explain system call errors'
pkgver='1.4.D001'
pkgrel=10
arch=('i686' 'x86_64')
url="http://libexplain.sourceforge.net/"
license=('LGPLv2')
makedepends=('libcap' 'lsof' 'libtool' 'groff' 'bison' 'gcc' 'quilt')
source=("git+https://salsa.debian.org/debian/libexplain#tag=debian/${pkgver}-${pkgrel}")
options=(libtool staticlibs)
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname"
  QUILT_PATCHES=debian/patches quilt push -a
}

build() {
  cd "$srcdir/$pkgname"
  CPPFLAGS='-fPIC' ./configure --prefix=/usr
  make -j$(nproc)
}

package() {
  cd "$srcdir/$pkgname"
  make install DESTDIR="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
