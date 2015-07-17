# Maintainer: James Harvey <jamespharvey20@gmail.com>
# * OpenFabrics Alliance InfiniBand network diagnostic and testing utilities
# Namcap errors: Insecure RPATH 'usr/lib64 in files usr/lib/ibis1.5.7/libibis.so.1.5.7, usr/lib/ibis

pkgname=ibutils
pkgver=1.5.7
_pkgver_subver=0.2
_pkgver_commit=gbd7e502
pkgrel=1
pkgdesc='OpenFabrics Alliance InfiniBand network diagnostic and testing utilities'
arch=('x86_64' 'i686')
url=('https://www.openfabrics.org/index.php/overview.html')
license=('GPL2' 'custom:"Open Fabrics Alliance BSD"')
depends=('opensm' 'tk' 'perl')
source=("https://www.openfabrics.org/downloads/${pkgname}/${pkgname}-${pkgver}-${_pkgver_subver}.${_pkgver_commit}.tar.gz")
md5sums=('8c296a4262a91078d61f20dc58adee9d')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr \
              --sbindir=/usr/bin \
              --libexecdir=/usr/lib \
              --sysconfdir=/etc \
              --localstatedir=/var \
              --mandir=/usr/share/man \
              --with-tk-lib=/usr/lib/libtk8.6
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"

  # No reason this should be going into /usr/bin
  rm -f "${pkgdir}/usr/bin/git_version.tcl"
}
