# Contributor: Star Brilliant <echo bTEzMjUzQGhvdG1haWwuY29tCg== | base64 -d>

_pkgbasename=sandbox
pkgname=lib32-$_pkgbasename
pkgver=2.6
pkgrel=1
pkgdesc="sandbox'd LD_PRELOAD hack (32-bit)"
arch=('x86_64')
url='http://www.gentoo.org/'
license=('GPL')
depends=('lib32-glibc')
source=(http://distfiles.gentoo.org/distfiles/$_pkgbasename-$pkgver.tar.xz)
md5sums=('83c63d4959c0ebe89685b83f4bbd9f23')

build() {
  cd "$srcdir"/$_pkgbasename-$pkgver
  export CFLAGS="$CFLAGS -m32"
  export CPPFLAGS="$CFLAGS -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  ./configure --prefix=/usr --libdir=/usr/lib32 --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd "$srcdir"/$_pkgbasename-$pkgver
  make DESTDIR="$pkgdir" install
  rm -rf "$pkgdir"/{etc,usr/share,usr/bin}
}

# vim:set ts=2 sw=2 et:
