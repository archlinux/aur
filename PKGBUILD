# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Contributor: Score_Under <seejay.11@gmail.com>

pkgname=xnp2
pkgver=20140607
pkgrel=2
pkgdesc="X Neko Project II, a PC-9801 emulator"
arch=('i686' 'x86_64')
url="http://www.nonakap.org/np2/"
license=('BSD')
depends=('gtk2' 'sdl_mixer')
source=("http://www.nonakap.org/np2/${pkgname}-${pkgver}.tar.bz2"
        "fix-alignment.patch")
md5sums=('4e2e01bc75479ef196b0056a78d31bd6'
         '8aa797282e965289d59b1ca0c7160435')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p0 < ../fix-alignment.patch
}

build() {
  cd "$srcdir/$pkgname-$pkgver/x11"
  ./configure --prefix=/usr --enable-ia32
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/x11"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sts=2 sw=2 et:
