# vim:set ts=2 sw=2 et:
# Maintainer: Donald Webster <fryfrog@gmail.com>
# Contributor: BlackEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Sébastien Luttringer <seblu@aur.archlinux.org

pkgname=par2cmdline-turbo
pkgver=1.2.0
pkgrel=1
pkgdesc='A faster PAR 2.0 compatible file verification and repair tool, forked from par2cmdline'
url='https://github.com/animetosho/par2cmdline-turbo'
license=('GPL2')
arch=('x86_64')
depends=('gcc-libs')
source=($pkgname-$pkgver.tar.gz::"https://github.com/animetosho/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('50b0548574c421899073dd2259d2841c8dd378b94a43b9060660ce9c2c964951ea539661beb24a0aa30b577f710c9b1df9b8c04b47aff41f4cd239413995711f')
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
