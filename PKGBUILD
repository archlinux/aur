# vim:set ts=2 sw=2 et:
# Maintainer: Donald Webster <fryfrog@gmail.com>
# Contributor: BlackEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Sébastien Luttringer <seblu@aur.archlinux.org

pkgname=par2cmdline-turbo
pkgver=1.0.0
pkgrel=1
pkgdesc='A faster PAR 2.0 compatible file verification and repair tool, forked from par2cmdline'
url='https://github.com/animetosho/par2cmdline-turbo'
license=('GPL2')
arch=('x86_64')
depends=('gcc-libs')
source=($pkgname-$pkgver.tar.gz::"https://github.com/animetosho/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('d05cf96a8943aff8f1ae00ecc910603bb9c623c13f427964897ad00a67b60707efd5d6fcbae7d5d7b324062bf69738cdb0fac18e2747fcfaf59d30b61262af6b')
provides=('par2cmdline')
conflicts=('par2cmdline')

build() {
  cd "$pkgname-$pkgver"
  aclocal
  automake --add-missing
  autoconf
  ./configure --prefix=/usr
  make
}

check() {
  cd "$pkgname-$pkgver"
  make -j1 check
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
