# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=lostirc
pkgver=0.4.6
pkgrel=3
pkgdesc="A simple, yet very useful IRC client"
arch=('i686' 'x86_64')
url="http://lostirc.sourceforge.net/"
license=('GPL')
depends=('gtk2' 'gtkmm' 'libsigc++')
makedepends=('patch')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz
        $pkgname-$pkgver-gcc.diff)
md5sums=('501cd56bc0740d599540fb415718b939'
         '5ac26f2e3beaa233b350de2cf8330923')

prepare() {
  cd "${srcdir}"/$pkgname-$pkgver

  patch -Np0 -i "${srcdir}"/$pkgname-$pkgver-gcc.diff
}

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make DESTDIR="${pkgdir}" install
}
