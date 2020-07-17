# Maintainer: Chuan Liu <liuchuan@liuchuan.org>

pkgbase=libexplain
pkgname='libexplain'
pkgdesc='A library to explain system call errors'
pkgver='1.4.D001'
pkgrel=10
arch=('i686' 'x86_64')
url="http://libexplain.sourceforge.net/"
license=('LGPLv2')
makedepends=('libcap' 'lsof' 'libtool' 'groff' 'bison' 'gcc')
source=("git+https://salsa.debian.org/debian/libexplain#tag=debian/${pkgver}-${pkgrel}")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname"

  patch -Np1 -i debian/patches/01_autofoo.patch
  patch -Np1 -i debian/patches/02_alpha-fcntl-h.patch
  patch -Np1 -i debian/patches/03_fsflags-4.5.patch
  patch -Np1 -i debian/patches/04_test-t0274a.patch
  patch -Np1 -i debian/patches/05_largefile.patch
  patch -Np1 -i debian/patches/06_sysctl.patch
  patch -Np1 -i debian/patches/07_ustat.patch
  patch -Np1 -i debian/patches/08_hppa.patch
  patch -Np1 -i debian/patches/fix-tests-sed.patch
  patch -Np1 -i debian/patches/gcc-10.patch
  patch -Np1 -i debian/patches/nettstamp-needs-types.patch
  patch -Np1 -i debian/patches/sanitize-bison.patch
  patch -Np1 -i debian/patches/typos.patch
}

build() {
  cd "$srcdir/$pkgname"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
