# Maintainer:  uffe < uffe at uffe dat org >

pkgname=hexcurse-ng-git
pkgver=v1.70.0.r1.g6c89ada
pkgrel=1
pkgdesc="Versatile ncurses-based console hexeditor written in C"
arch=('x86_64')
url="https://github.com/prso/hexcurse-ng"
license=('GPL-2.0-only')
makedepends=('git')
depends=('ncurses')
provides=('hexcurse')
conflicts=('hexcurse')
options=('!makeflags')
source=("git+https://github.com/prso/hexcurse-ng")
md5sums=('SKIP')

pkgver()
{
  cd "${srcdir}/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build()
{
  cd "${srcdir}/${pkgname%-git}"

  autoreconf -f -i
  ./configure --prefix=/usr --mandir=/usr/share/man

  make
}

package()
{
  cd "$srcdir/${pkgname%-git}"

  make DESTDIR="${pkgdir}/" install
}

#
# EOF
#