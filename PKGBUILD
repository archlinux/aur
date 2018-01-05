# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=xpacman2
pkgver=1.002
pkgrel=6
pkgdesc="another X pacman game"
arch=('x86_64')
url="ftp://ftp.nvg.unit.no/pub/pacman/"
license=('GPL')
depends=(libx11 ncurses gcc-libs)
makedepends=()
source=(https://sources.archlinux.org/other/$pkgname/pacman-${pkgver/./_}.tar.gz
	build-fix.patch)
md5sums=('afcbc268d1eff6ea3a834c7a5f715f77'
         '4faf33134a2a74f284059a2971833fa1')

build() {
  cd "$srcdir"/pacman-${pkgver/./_}
  patch -Np1 <../build-fix.patch
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/pacman-${pkgver/./_}
  make DESTDIR="$pkgdir" install
  (cd "$pkgdir"/usr/bin/ && mv pacman xpacman2)
}
