pkgname=asio-patched
pkgver=1.10.6
pkgrel=1
pkgdesc="Cross-platform C++ library for ASynchronous network I/O (patched for recent OpenSSL versions)"
arch=('i686' 'x86_64')
url="http://asio.sourceforge.net"
license=('custom')
depends=('boost')
provides=("${pkgname%-patched}==${pkgver}")
conflicts=("${pkgname%-patched}")
source=("http://downloads.sourceforge.net/${pkgname%-patched}/${pkgname%-patched}-${pkgver}.tar.bz2"
        "openssl-nosslv3.patch")
md5sums=('85d014a356a6e004cd30ccd4c9b6a5c2'
         'cdc66d0cb649880bf4b87bbe0b411814')

prepare() {
  cd "${srcdir}/${pkgname%-patched}-${pkgver}"
  patch -p1 < ../openssl-nosslv3.patch
}

build() {
  cd "${srcdir}/${pkgname%-patched}-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname%-patched}-${pkgver}"

  make DESTDIR=${pkgdir} install
  #license
  install -D -m644 LICENSE_1_0.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
