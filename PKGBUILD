# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=guile-git
_gitname=guile
pkgver=v2.1.0.439.g4aabc20
pkgrel=1
pkgdesc="A portable, embeddable Scheme implementation (Git snapshot)"
arch=(i686 x86_64)
license=('GPL')
makedepends=('git')
provides=('guile')
depends=('gc' 'libtool' 'libffi' 'libunistring')
conflicts=('guile' 'guile-devel')
options=('!strip' '!makeflags' 'libtool')
source=("git://git.sv.gnu.org/$_gitname.git")
url="http://www.gnu.org/software/guile/"
md5sums=('SKIP')
install=$pkgname.install

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
