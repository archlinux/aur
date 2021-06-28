# Maintainer: Jonathan Shreckengost <jonathanshrek@gmail.com>

pkgname=libvshadow-git
pkgver=20210507.9f06d79
pkgrel=1
pkgdesc='Library to access the Volume Shadow Snapshot (VSS) format'
arch=('any')
url='https://github.com/libyal/libvshadow'
license=('LGPL')
provides=('libvshadow-git')
conflicts=('libvshadow')
groups=()
depends=('libbfio-git')
makedepends=('git' 'autoconf' 'automake' 'libtool' 'gettext' 'pkg-config' 'bison' 'flex')
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
