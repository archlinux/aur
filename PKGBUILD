# Maintainer: mastero23 <mastero23 at gmail dot com>

pkgname=lndir
pkgver=1.0.4
pkgrel=1
pkgdesc="Create a shadow directory of symbolic links to another directory tree"
arch=('i686' 'x86_64')
url="http://xorg.freedesktop.org/"
license=('custom')
depends=('glibc')
conflicts=('imake')
source=(http://xorg.freedesktop.org/archive/individual/util/$pkgname-$pkgver.tar.xz)
md5sums=('a56ce1f81960e4b5af1730e4f5262162')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --localstatedir=/var
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install  
  install -D -m 644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
