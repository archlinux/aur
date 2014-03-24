# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>

pkgname=liblcf-git
pkgver=0.1.2.r126.ge806e5a
pkgrel=1
pkgdesc="Library to handle RPG Maker 2000/2003 and EasyRPG projects (development version)"
arch=('i686' 'x86_64')
url="https://easy-rpg.org/"
license=('MIT')
conflicts=('liblcf')
provides=('liblcf')
depends=('gcc-libs')
makedepends=('boost' 'git' 'expat')
source=(liblcf::"git+https://github.com/EasyRPG/liblcf.git")
md5sums=('SKIP')

pkgver() {
  cd liblcf
  git describe --long | sed 's/-/.r/;s/-/./'
}

build () {
  cd liblcf

  autoreconf -i
  ./configure --prefix=/usr
  make
}

check() {
  cd liblcf

  make check
}

package () {
  cd liblcf

  make DESTDIR="$pkgdir/" install
  # license
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
