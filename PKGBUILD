# Maintainer: Jonathan Shreckengost <jonathanshrek@gmail.com>
# Contributor: Jaryl Chng <mrciku@gmail.com>

pkgname='libbfio-git'
pkgver='20210624.bfa1f2f'
pkgrel=1
pkgdesc='Library to provide basic file input/output abstraction'
arch=('any')
url='https://github.com/libyal/libbfio'
license=('LGPL')
provides=('libbfio')
conflicts=('libbfio')
groups=()
depends=()
makedepends=('git' 'autoconf' 'automake' 'libtool' 'gettext' 'pkg-config' 'bison' 'flex')
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

