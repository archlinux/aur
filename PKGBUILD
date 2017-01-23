# $Id$
# Maintainer: Andreas Rammhold <andreas@rammhold.de>

pkgname=xf86-video-nouveau-git
_pkgname=xf86-video-nouveau
pkgver=1.0.13+7+g1516d35
pkgrel=1
pkgdesc="Open Source 2D acceleration driver for nVidia cards"
arch=('i686' 'x86_64')
url="http://nouveau.freedesktop.org/"
license=('GPL')
depends=('libdrm' 'systemd' 'mesa-dri')
makedepends=('xorg-server-devel' 'git')
conflicts=('xorg-server<1.19' 'X-ABI-VIDEODRV_VERSION<23' 'X-ABI-VIDEODRV_VERSION>=24', 'xf86-video-nouveau')
groups=('xorg-drivers' 'xorg')
install=$pkgname.install
#source=(http://xorg.freedesktop.org/archive/individual/driver/$pkgname-$pkgver.tar.bz2)
source=('git://anongit.freedesktop.org/nouveau/xf86-video-nouveau')
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long | sed 's/xf86-video-nouveau-//' | sed 's/-/+/g'
}

prepare() {
  cd $_pkgname
  NOCONFIGURE=1 ./autogen.sh

#  mkdir $pkgname-$pkgver
}

build() {
#  cd $pkgname-$pkgver
  cd $_pkgname
  ./configure --prefix=/usr
  make
}

package() {
#  cd $pkgname-$pkgver
  cd $_pkgname
  make DESTDIR="$pkgdir" install
}
