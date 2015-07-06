# Maintainer: melchips <truphemus dot francois at gmail dot com>

pkgname=soup-sharp-git
_gitname=soup-sharp
pkgver=r4.ee413bb
pkgrel=1
pkgdesc="C-sharp Bindings for libsoup2.4"
arch=('i686' 'x86_64')
url="https://github.com/xDarkice/soup-sharp"
license=('LGPL')
depends=('mono' 'gtk-sharp-git' 'libsoup')
makedepends=('git')
options=('!libtool')
provides=('soup-sharp')
conflicts=('soup-sharp')
source=("$_gitname"::'git://github.com/xDarkice/soup-sharp.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_gitname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_gitname"

  msg2 "Starting make..."
  ./autogen.sh --prefix=/usr
  make || return 1
}

package() {
    cd ${srcdir}/${_gitname}
    make DESTDIR=${pkgdir} install || return 1
}
