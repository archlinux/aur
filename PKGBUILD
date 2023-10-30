# Maintainer: tarball <bootctl@gmail.com>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Kevin Piche <kevin@archlinux.org>
# Contributor: Roberto Carvajal <roberto@archlinux.org>

pkgname=multitail
pkgver=7.1.2
pkgrel=1
pkgdesc="Lets you view one or multiple files like the original tail program"
arch=('x86_64')
license=('GPL')
url="https://www.vanheusden.com/multitail"
depends=('ncurses')
makedepends=('cmake')
backup=('etc/multitail.conf')
#source=("https://www.vanheusden.com/multitail/${pkgname}-${pkgver}.tgz")
source=(https://github.com/folkertvanheusden/multitail/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('c8552e10093f0690b8baef84945753c878e234d7b3d0e3ff27e509ed5515998c')

prepare() {
  cd $pkgname-$pkgver
  sed -i 's|ncursesw/panel.h|panel.h|' mt.h
  sed -i 's|ncursesw/ncurses.h|ncurses.h|' mt.h
}

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  mv "$pkgdir"/{usr/,}etc
  mv "$pkgdir"/etc/multitail.conf{.new,}
  mv "$pkgdir"/usr/share/doc/multitail{-VERSION=$pkgver,}
}

# vim: ts=2 sw=2 et ft=sh
