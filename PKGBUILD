# Maintainer: Doug Newgard <scimmia22 at outlook dot com>

pkgname=enventor-git
_pkgname=${pkgname%-*}
pkgver=0.2.0.248.817dd1b
pkgrel=1
pkgdesc="Editor for EDC files (edje/efl) - Development version"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('GPL3')
depends=('elementary>=1.7.99')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git://git.enlightenment.org/tools/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  for i in v_maj v_min v_mic; do
    local _$i=$(grep -m 1 $i configure.ac | sed 's/m4//' | grep -o "[[:digit:]]*")
  done

  echo $_v_maj.$_v_min.$_v_mic.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$_pkgname"

  ./autogen.sh \
    --prefix=/usr \
    --disable-static

  make
}

package() {
  cd "$srcdir/$_pkgname"
  
  make DESTDIR="$pkgdir" install
}
