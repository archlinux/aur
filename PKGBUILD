# Maintainer: Otto Naderer <otto.naderer@openmailbox.org>
pkgname=twister-core-git
pkgver=4689.adc9e82
pkgrel=1
pkgdesc="Twister core - p2p microblogging"
arch=(i686 x86_64 armv7h armv6h)
url="http://twister.net.co/"
license=('MIT' 'BSD')
groups=()
depends=(openssl db boost-libs miniupnpc)
makedepends=('git' 'boost')
source=("git://github.com/miguelfreitas/twister-core.git")
md5sums=("SKIP")

_gitname=twister-core

build() {
  cd "$srcdir/$_gitname/libtorrent"
  ./bootstrap.sh
  if test "$CARCH" == armv6h; then
    ./configure --enable-logging --enable-debug --enable-dht --enable-sse2=no
  else
    ./configure --enable-logging --enable-debug --enable-dht
  fi
  make

  cd "$srcdir/$_gitname/src"
  make -f makefile.unix
}

package() {
  cd "$srcdir/$_gitname/src/"
  mkdir -p "$pkgdir/usr/bin/"
  install twisterd "$pkgdir/usr/bin/"
}

pkgver() {
  cd $_gitname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}


# vim:set ts=2 sw=2 et:

