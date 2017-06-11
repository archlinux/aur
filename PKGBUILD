# $Id: PKGBUILD 213872 2014-05-30 21:30:40Z bisson $
# Maintainer: Brian Bidulock <bidulock@Openss7.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgname=libvncserver-git
pkgver=0.9.11.r108.gada4b4f
pkgrel=1
pkgdesc='VNC server for real X displays'
url="https://LibVNC.github.io"
arch=('i686' 'x86_64')
license=('GPL')
options=('!emptydirs')
depends=('libpng' 'libjpeg' 'gnutls' 'libgcrypt')
provides=('libvncserver')
conflicts=('libvncserver')
makedepends=('git' 'cmake')
source=("$pkgname::git+https://github.com/libvnc/libvncserver.git")
sha1sums=('SKIP')

pkgver() {
  cd $pkgbase
  git describe --tags --long | sed -r -e 's,^[^0-9]*,,;s,([0-9]*-g),r\1,;s,[-_],.,g'
}

build() {
  cd $pkgbase
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd $pkgbase
  make DESTDIR="$pkgdir" install
}

