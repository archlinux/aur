# Maintainer: yjun <jerrysteve1101 at gmail dot com>
# Contributor: Marco44 <cousinmarc at gmail dot com>

pkgname=driftnet-git
_gitname=driftnet
pkgver=v1.3.0.r2.gc64d118
pkgrel=1
pkgdesc="Driftnet watches network traffic, and picks out and displays JPEG and GIF images for display"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url=https://github.com/deiv/driftnet
license=('GPL3')
depends=('libpcap' 'libjpeg' 'libpng12' 'giflib' 'gtk2' 'libwebsockets')
makedepends=(git)
conflicts=('driftnet')
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
