# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=asclock-classic
_pkgname=asclock
pkgver=1.0
pkgrel=1
pkgdesc="The AfterStep clock dock app - Xlib version"
url="http://www.cs.mun.ca/~gstarkes/wmaker/dockapps/time.html#asclock"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libxpm')
provides=('asclock')
conflicts=('asclock-classic' 'asclock-gtk')
source=("http://www.cs.mun.ca/~gstarkes/wmaker/dockapps/files/$pkgname-$pkgver.tar.gz"
        "asclock.desktop")
md5sums=('fc7f280e77b2646a02fd0dd42ac31ceb'
         '00cbeb63e46bc7c402e20680e0aa1fec')

prepare() {
  cd "$srcdir/${_pkgname}$pkgver"
  echo -e "\n\n" | ./configure >/dev/null
}

build() {
  cd "$srcdir/${_pkgname}$pkgver"
  make clean
  make
}

package() {
  cd "$srcdir/${_pkgname}$pkgver"
  make DESTDIR="$pkgdir" install install.man
  install -Dm0644 "$srcdir/asclock.desktop" \
    "$pkgdir/usr/share/applications/asclock.desktop"
}

# vim: set sw=2 et:
