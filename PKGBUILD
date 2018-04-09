# Maintainer: Marco44 <cousinmarc at gmail dot com>
pkgname=driftnet-git
_gitname=driftnet
pkgver=v1.1.3.r23.g73414bf
pkgrel=1
pkgdesc="get files out of a tcp stream"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url=https://github.com/deiv/driftnet
license=('GPL3')
depends=('libpcap' 'libjpeg' 'libpng12' 'giflib' 'gtk2')
builddepends=('autoconf')
makedepends=(git)
options=(!emptydirs !libtool)
source=('git://github.com/deiv/driftnet.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  local _gitdir=$srcdir/$_gitname
  cd $_gitdir
  git clean -dfx
  git reset --hard
  autoreconf -fi
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$_gitname
  make DESTDIR=$pkgdir install
}
