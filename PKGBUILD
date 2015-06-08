# Contributor: lynix <lynix47@gmail.com>
# Maintainer: lynix <lynix47@gmail.com>

pkgname=aerotools-git
pkgver=20101208
pkgrel=1
pkgdesc="CLI and hddtemp proxy for querying aquaero(R) 4.0 USB devices"
arch=('i686' 'x86_64')
url="http://github.com/lynix/aerotools/"
license=('GPL3')
depends=('libusb>=1.0.8')
makedepends=('git' 'pkgconfig')
provides=('aerotools')
conflicts=('aerotools')
source=()
md5sums=()

_gitroot="git://github.com/lynix/aerotools.git"

build() {
  msg "Connecting to GIT server..."
  if [[ -d $srcdir/$pkgname-$pkgver ]]; then
    cd $srcdir/$pkgname-$pkgver && git pull origin
  else
    git clone $_gitroot $srcdir/$pkgname-$pkgver
    cd $srcdir/$pkgname-$pkgver
  fi

  msg "GIT checkout done or server timeout"

	make
}

package() {
	make DESTDIR=$pkgdir PREFIX=/usr install
}

# vim:set ts=2 sw=2 et:
