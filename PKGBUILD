# Maintainer: Remi Gacogne <rgacogne-arch at coredump dot fr>

pkgname=getdns
pkgver=0.3.2
pkgrel=1
pkgdesc="A modern asynchronous DNS API"
arch=('i686' 'x86_64')
url="http://getdnsapi.net/"
license=('BSD')
depends=('libev' 'libevent' 'libidn' 'libuv' 'unbound')
source=("https://getdnsapi.net/dist/${pkgname}-${pkgver}.tar.gz"
	"https://getdnsapi.net/dist/${pkgname}-${pkgver}.tar.gz.asc"
)
sha256sums=('6944b0d9fd3fd33ee2fcd8e2dc123a3097ac95255092b4a3b8ee36400f85dba7'
            'SKIP')
validpgpkeys=('DC34EE5DB2417BCC151E5100E5F8F8212F77A498' # Willem Toorop <willem@nlnetlabs.nl>
)

install=install

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/"
  ./configure          \
    --prefix=/usr      \
    --sysconfdir=/etc  \
    --disable-rpath    \
    --enable-static=no \
    --with-libev       \
    --with-libevent    \
    --with-libuv
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/"

  make prefix="${pkgdir}/usr" install

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
