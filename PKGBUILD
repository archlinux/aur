pkgname=tmate-git
pkgver=2.2.0
pkgrel=1
pkgdesc="Instant Terminal Sharing http://tmate.io/"
arch=('i686' 'x86_64')
license=('MIT')
url="http://tmate.io/"
makedepends=('cmake' 'libevent' 'ncurses' 'openssl' 'zlib' 'ruby' 'msgpack-c')

gitroot="https://github.com/tmate-io/tmate.git"
gitname="tmate"
gitbranch="2.2.0"

build() {
  cd ${srcdir}
  if [[ -d ${gitname} ]] ; then
    cd ${gitname}
  else
    git clone -b ${gitbranch} --depth=1 ${gitroot} 
    cd ${gitname}
  fi
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd ${gitname}
  make DESTDIR=${pkgdir} install
}
