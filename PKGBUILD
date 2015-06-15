# Contributor: Max Devaine <maxdevaine@gmail.com>
# Contributor: Christopher Snowhill <chris@kode54.net>

pkgbase=multivnc-git
pkgname=$pkgbase
pkgver=1.6.4.r4.g18c96f6
pkgrel=1
pkgdesc='MultiVNC is a cross-platform Multicast-enabled VNC viewer using wxWidgets and libvncclient'
arch=(i686 x86_64)
url='http://github.com/bk138/multivnc'
license=('GPL')
makedepends=('git')
conflicts=('multivnc')
provides=('multivnc')

source=("$pkgname"::'git+https://github.com/bk138/multivnc.git')
md5sums=('SKIP')

pkgver() {
cd "$srcdir/$pkgname"
git describe --long --tags | sed -r 's/AndroidMultiVNC-//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"

  autoreconf -i
  ./configure --prefix=/usr
  make || return 1

}

package() {
cd "$srcdir/$pkgname"
make DESTDIR="$pkgdir" install
}

#category: network
# vim:set ts=2 sw=2 et:
