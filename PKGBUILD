# vim:set ts=2 sw=2 et:
# Maintainer: Donald Webster <fryfrog@gmail.com>
# Contributor: BlackEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Sébastien Luttringer <seblu@aur.archlinux.org

pkgname=par2cmdline-turbo
pkgver=1.0.1
pkgrel=1
pkgdesc='A faster PAR 2.0 compatible file verification and repair tool, forked from par2cmdline'
url='https://github.com/animetosho/par2cmdline-turbo'
license=('GPL2')
arch=('x86_64')
depends=('gcc-libs')
source=($pkgname-$pkgver.tar.gz::"https://github.com/animetosho/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('bc607d08852230df99238b9855577f656b02f53e219651812b3dc864df435eb091aa190e1f567445d57f8b106f0f863f45f578e58599ca78dc1a11f0c7377f25')
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
