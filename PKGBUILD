# vim:set ts=2 sw=2 et:
# Maintainer: Donald Webster <fryfrog@gmail.com>
# Contributor: BlackEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Sébastien Luttringer <seblu@aur.archlinux.org

pkgname=par2cmdline-turbo
pkgver=0.9.0
pkgrel=1
pkgdesc='A faster PAR 2.0 compatible file verification and repair tool, forked from par2cmdline'
url='https://github.com/animetosho/par2cmdline-turbo'
license=('GPL2')
arch=('x86_64')
depends=('gcc-libs')
source=($pkgname-$pkgver.tar.gz::"https://github.com/animetosho/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('29b7d2a5a32d714eb8f883512883d2a999f3f728f5cbbfff9837b3b03fda7b7e1a334ca8701443f2dc1c650793f81260ec4337452094b07d4760288295eaf760')
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
