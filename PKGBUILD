# Maintainer: Otto Naderer <otto.naderer@openmailbox.org>
pkgname=twister-core-git
pkgver=5090.323314eb
pkgrel=1
pkgdesc="Twister core - p2p microblogging"
arch=(i686 x86_64 armv7h armv6h)
url="http://twister.net.co/"
license=('MIT' 'BSD')
groups=()
depends=(openssl db boost-libs miniupnpc)
makedepends=('git' 'boost')
source=("git+https://github.com/miguelfreitas/twister-core.git")
md5sums=("SKIP")

_gitname=twister-core

build() {
  cd "$srcdir/$_gitname"
  if test "$CARCH" == armv6h; then
    ./bootstrap.sh --enable-logging --enable-dht --enable-sse2=no
  else
    ./bootstrap.sh --enable-logging --enable-dht
  fi
  make
}

package() {
  cd "$srcdir/$_gitname/"
  mkdir -p "$pkgdir/usr/bin/"
  install twisterd "$pkgdir/usr/bin/"
}

pkgver() {
  cd $_gitname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}


