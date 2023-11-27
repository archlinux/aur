# vim:set ts=2 sw=2 et:
# Maintainer: Donald Webster <fryfrog@gmail.com>
# Contributor: BlackEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Sébastien Luttringer <seblu@aur.archlinux.org

pkgname=par2cmdline-turbo
pkgver=1.1.1
pkgrel=1
pkgdesc='A faster PAR 2.0 compatible file verification and repair tool, forked from par2cmdline'
url='https://github.com/animetosho/par2cmdline-turbo'
license=('GPL2')
arch=('x86_64')
depends=('gcc-libs')
source=($pkgname-$pkgver.tar.gz::"https://github.com/animetosho/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('bb919f885134a298ba14551e21cf89a91aee292e437133e6973bef09fb5dee9a9b45e76a59320bfede864438d3ac884699be7ca3f7234896a9da14cb07ffa89d')
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
