# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Contributor: Score_Under <seejay.11@gmail.com>

pkgname=xnp2-git
_pkgname=xnp2
pkgver=20150503.g9a0baa6
pkgrel=1
pkgdesc="X Neko Project II, a PC-9801 emulator"
arch=('i686' 'x86_64')
url="http://www.nonakap.org/np2/"
license=('BSD')
depends=('gtk2' 'sdl_mixer')
source=("git://github.com/nonakap/xnp2.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/$_pkgname"

    git log -1 --format="%cd.g%h" --date=short | sed 's/-//g'
}

build() {
  cd "$srcdir/$_pkgname/x11"
  ./autogen.sh
  ./configure --prefix=/usr --enable-ia32
  make
}

package() {
  cd "$srcdir/$_pkgname/x11"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sts=2 sw=2 et:
