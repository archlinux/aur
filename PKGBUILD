pkgname=calcelestial
pkgver=0.3
pkgrel=1
pkgdesc="calculates positions, rise and set times of celestial bodies"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://www.steffenvogel.de/2012/12/23/cron-jobs-fur-sonnenauf-untergang/"
license=('GPL3')
depends=('libnova')
source=("https://github.com/stv0g/${pkgname}/archive/${pkgver}.tar.gz"
        "disable-geonames.patch")
md5sums=('SKIP'
         'a4bc96095f1096c6357150577650c438')
conflicts=()
provides=()

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -i ../disable-geonames.patch -p1
}

build() {
  cd "${pkgname}-${pkgver}"
  ./autogen.sh
  ./configure --prefix=/usr --disable-geonames
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}/" install
}
