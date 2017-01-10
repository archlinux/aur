# Maintainer: Jaryl Chng <mrciku@gmail.com>
pkgname=libpff-git
pkgver=20161215.56cdada
pkgrel=1
pkgdesc='Library to access the Personal Folder File (PFF) and the Offline Folder File (OFF) format'
arch=('any')
url='https://github.com/libyal/libpff'
license=('LGPL')
provides=('libpff-git')
conflicts=('libpff')
groups=()
depends=()
makedepends=('git')
optdepends=()
options=()
source=('git+https://github.com/libyal/libpff.git')
sha1sums=('SKIP')

_gitname="libpff"

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