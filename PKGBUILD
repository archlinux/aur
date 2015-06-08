# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=guile-git
_gitname=guile
pkgver=v2.1.0.360.gef5f2fc
pkgrel=1
pkgdesc="A portable, embeddable Scheme implementation (Git snapshot)"
arch=(i686 x86_64)
license=(gpl)
makedepends=(git)
provides=(guile)
depends=(gc 'gmp>=4.3.1' gperf libffi libtool
         libunistring 'ncurses>=5.7' texinfo)
conflicts=(guile guile-devel)
options=('!strip' '!makeflags')
source=("git://git.sv.gnu.org/$_gitname.git")
url="http://www.gnu.org/software/guile/"
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  #echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
  git describe --tags |sed 's+-+.+g'
}

build() {
  cd $_gitname
  ./autogen.sh
  CFLAGS="" ./configure --prefix=/usr --disable-error-on-warning
  make LDFLAGS+="-lpthread"
}

package() {
  cd $_gitname
  make DESTDIR="$pkgdir/" install
}
