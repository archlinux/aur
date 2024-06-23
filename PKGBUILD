# Maintainer: yjun <jerrysteve1101 at gmail dot com>
# Contributor: Marco44 <cousinmarc at gmail dot com>

pkgname=driftnet-git
_gitname=driftnet
pkgver=v1.5.0.r22.gd7922b1
pkgrel=1
pkgdesc="Driftnet watches network traffic, and picks out and displays JPEG and GIF images for display"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url=https://github.com/deiv/driftnet
license=('GPL-2.0-only')
depends=('libpcap'
	 'libjpeg'
	 #'libungif'
	 'giflib'
	 'libpng'
	 'libwebp'
	 'libwebsockets'
	 'gtk3'
)
makedepends=(git)
conflicts=('driftnet')
source=('git+https://github.com/deiv/driftnet.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  local _gitdir=$srcdir/$_gitname

  cd $_gitdir
  autoreconf -fi
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$_gitname

  make DESTDIR=$pkgdir install
}
