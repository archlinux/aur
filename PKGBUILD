# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Judd Vinet <jvinet@zeroflux.org>
# Contributor: Curtis Campbell <curtisjamescampbell@hotmail.com>

pkgname=usbutils-git
pkgver=013
pkgrel=1
pkgdesc="A collection of USB tools to query connected USB devices"
arch=('x86_64')
url="https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usbutils.git/"
license=('GPL2')
depends=('glibc' 'hwids')
makedepends=('libusb')
optdepends=('python: for lsusb.py usage'
            'coreutils: for lsusb.py usage')
provides=(usbutils)
conflicts=(usbutils)
source=("git+https://github.com/gregkh/usbutils")
b2sums=('SKIP')
#validpgpkeys=('647F28654894E3BD457199BE38DBBDC86092693E') # Greg Kroah-Hartman <gregkh@linuxfoundation.org>

pkgver() {
  cd usbutils
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd usbutils

  ./autogen.sh
  ./configure --prefix=/usr \
              --datadir=/usr/share/hwdata
  make
}

package() {
  cd usbutils
  make DESTDIR="$pkgdir" install
  install -vDm 644 {README.md,NEWS} -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
