# Maintainer : Immae <ismael.bouya@normalesup.org>

pkgname=editline
pkgver=1.16.1
pkgrel=1
pkgdesc="A readline() replacement for UNIX without termcap (ncurses)"
arch=('x86_64')
url="http://troglobit.com/editline.html"
license=('BSD')
source=("https://github.com/troglobit/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('32c8362cd553ff616ecbb259705d6ed13a48f5bae0616c9770d9c254e07723bbd957de8ad0643d0652ec73e8e99e8c45e7f060461ba316b0eb30d911d772b029')


build () {
  cd "$pkgname-$pkgver"
  ./autogen.sh
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --enable-gc
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  mv $pkgdir/usr/share/man/man3/editline.3 $pkgdir/usr/share/man/man3/editline-troglobit.3
}
