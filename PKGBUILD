# Maintainer: Nicolas Quiénot <niQo @ AUR >
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=geis
pkgver=2.2.17
pkgrel=2
pkgdesc="Implementation of the GEIS (Gesture Engine Interface and Support) interface."
arch=('i686' 'x86_64')
url="https://launchpad.net/geis"
license=('GPL' 'LGPL')
depends=('grail' 'dbus' 'python-gobject')
makedepends=('xorg-server-devel')
provides=('utouch-geis')
conflicts=('utouch-geis')
replaces=('utouch-geis')
options=('!emptydirs' '!libtool')
source=("http://launchpad.net/${pkgname}/trunk/${pkgver}/+download/${pkgname}-${pkgver}.tar.xz")
md5sums=('2ff9d76a3ea5794516bb02c9d1924faf')


prepare() {
    cd "$pkgname-$pkgver"
}

build() {
  cd "$pkgname-$pkgver"

  ## add -Wno-format in CFLAGS see FS#34658
  CFLAGS="$CFLAGS -Wno-format -Wno-misleading-indentation -Wno-error" ./configure --prefix=/usr --disable-static
  make 
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="${pkgdir}/" install
}

