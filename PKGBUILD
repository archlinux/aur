# Maintainer: Nicolas Quiénot <niQo @ AUR >
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=geis
pkgver=2.2.16
pkgrel=1
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
source=("http://launchpad.net/${pkgname}/trunk/${pkgver}/+download/${pkgname}-${pkgver}.tar.gz" \
        "http://bazaar.launchpad.net/~ken-vandine/geis/lp1428314/diff/328?context=3")
md5sums=('550c78b5185b835b80dba14537c2c83d'
         '2ff7e280b846f363691c3749930bd79d')

prepare() {
    cd "$pkgname-$pkgver"
    patch -p0 -i '../328?context=3'
}

build() {
  cd "$pkgname-$pkgver"

  ## add -Wno-format in CFLAGS see FS#34658
  CFLAGS="$CFLAGS -Wno-format" ./configure --prefix=/usr --disable-static
  make 
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="${pkgdir}/" install
}

