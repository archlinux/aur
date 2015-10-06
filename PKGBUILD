# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=guile-git
_gitname=guile
pkgver=2.1.0.456.g315adb6
pkgrel=1
pkgdesc="A portable, embeddable Scheme implementation (Git snapshot)"
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('git')
optdepends=('texinfo: for using texinfo scheme sources')
provides=('guile')
depends=('gc' 'libtool' 'libffi' 'libunistring' 'gmp')
conflicts=('guile' 'guile-devel')
options=('!strip' '!makeflags' 'libtool')
source=("git://git.sv.gnu.org/$_gitname.git")
url="http://www.gnu.org/software/guile/"
md5sums=('SKIP')
install=$pkgname.install

pkgver() {
  cd $_gitname
  git describe --tags |sed 's+-+.+g'|sed 's+^v++'
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
