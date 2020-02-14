# Maintainer: 3mb3dw0rk5 <3mb3dw0rk5 at gmail dot com>

pkgname=hexcurse-git
pkgver=v1.60.0.r6.ga7d60e8
pkgrel=1
pkgdesc="Versatile ncurses-based hex editor."
arch=('i686' 'x86_64')
#url="http://directory.fsf.org/project/HexCurse/"
url="https://github.com/LonnyGomes/hexcurse"
license=('GPL')
depends=('ncurses')
options=('!makeflags')
source=("git+https://github.com/LonnyGomes/hexcurse"
        "hexcurse_gccerrors.patch")
md5sums=('SKIP'
         '0d1229aa298581c16493a26f25ff40f2')

function pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
  patch --forward --strip=1 --input="${srcdir}/hexcurse_gccerrors.patch"
}

build() {
  cd "$srcdir/${pkgname%-git}"

  autoreconf -f -i
  ./configure \
	--prefix=/usr \
	--mandir=/usr/share/man

  make
}

package() {
  cd "$srcdir/${pkgname%-git}"

  make DESTDIR="$pkgdir/" install
}
