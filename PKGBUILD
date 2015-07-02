# Maintainer: Miguel Revilla <yo@miguelrevilla.com>
# Contributor: Miguel Revilla <yo@miguelrevilla.com>

pkgname=libodb
pkgver=2.4.0
pkgrel=1
pkgdesc="The ODB common runtime library"
arch=('i686' 'x86_64')
depends=('gcc-libs')
url="http://www.codesynthesis.com/products/odb/"
options=('!libtool')
license=('GPL')
source=("http://www.codesynthesis.com/download/odb/2.4/libodb-${pkgver}.tar.bz2")
md5sums=('ae3842876f4f30c78e9d71fcf945ff7a')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr --libdir=/usr/lib/odb --with-pkgconfigdir=/usr/lib/pkgconfig
  make ECHO=echo
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make ECHO=echo DESTDIR="${pkgdir}" install

  install -d -m 755 "${pkgdir}"/etc/ld.so.conf.d
  echo "/usr/lib/odb" > "${pkgdir}"/etc/ld.so.conf.d/${pkgname}.conf

  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
