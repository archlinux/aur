# Maintainer: Jaryl Chng <mrciku@gmail.com>
pkgname=libbfio-git
pkgver=20161216.66eccc8
pkgrel=1
pkgdesc='Library to provide basic file input/output abstraction'
arch=('i686' 'x86_64')
url='https://github.com/libyal/libbfio'
license=('LGPL')
provides=('libbfio-git')
conflicts=('libbfio')
groups=()
depends=()
makedepends=('git')
optdepends=()
options=()
source=('git+https://github.com/libyal/libbfio.git')
sha1sums=('SKIP')

_gitname="libbfio"

pkgver() {
  cd "$srcdir/$_gitname"
  git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
  cd "$_gitname"

  ./synclibs.sh
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc

  make
}

package() {
  cd "$_gitname"
  make DESTDIR="$pkgdir/" install
}