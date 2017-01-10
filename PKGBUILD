# Maintainer: Jaryl Chng <mrciku@gmail.com>
pkgname=libvshadow-git
pkgver=20161225.e22b93f
pkgrel=1
pkgdesc='Library to access the Volume Shadow Snapshot (VSS) format'
arch=('any')
url='https://github.com/libyal/libvshadow'
license=('LGPL')
provides=('libvshadow-git')
conflicts=('libvshadow')
groups=()
depends=()
makedepends=('git')
optdepends=()
options=()
source=('git+https://github.com/libyal/libvshadow.git')
sha1sums=('SKIP')

_gitname="libvshadow"

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