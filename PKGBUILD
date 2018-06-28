# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=libcerror-git
pkgver=20180515.56224d9
pkgrel=1
pkgdesc='Library for cross-platform C error functions'
arch=('any')
url='https://github.com/libyal/libcerror'
license=('LGPL')
provides=('libcerror-git')
conflicts=('libcerror')
groups=()
depends=()
makedepends=('git' 'autoconf' 'automake' 'libtool' 'gettext' 'pkg-config' 'bison' 'flex')
optdepends=()
options=()
source=('git+https://github.com/libyal/libcerror.git')
sha1sums=('SKIP')

_gitname="libcerror"

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
