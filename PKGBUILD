# Maintainer: Ivan Shapovalov <intelfx100@gmail.com>
# Contributor: vldmr <vldmr@lavabit.com>
# Contributor: Thomas Krug <phragment@lavabit.com>
# Contributor: Matthew Bauer <mjbauer95@gmail.com>

pkgname=libfprint-git
epoch=1
pkgver=0.5.1.r13.g35e356f
pkgrel=1
pkgdesc="Library for fingerprint readers"
arch=(i686 x86_64)
url="http://www.freedesktop.org/wiki/Software/fprint/libfprint"
license=(LGPL)
depends=(libusb nss gdk-pixbuf2)
makedepends=(git)
groups=(fprint-git)
provides=(libfprint)
conflicts=(libfprint)
source=("git://anongit.freedesktop.org/libfprint/libfprint.git")
md5sums=('SKIP')

pkgver() {
  cd libfprint
  git describe --long --tags 2>/dev/null | sed 's/^v_//;s/\([^-]*-g\)/r\1/;s/[-_]/./g'
}

build() {
  cd libfprint
  ./autogen.sh --prefix=/usr \
               --sysconfdir=/etc \
               --disable-static
  make
}

package() {
  cd libfprint
  make DESTDIR="$pkgdir" install
}
