# Maintainer: James P. Harvey <jamespharvey20 at gmail dot com>

pkgname=ibutils
pkgver=1.5.7
_pkgver_subver=0.2
_pkgver_commit=gbd7e502
pkgrel=2
pkgdesc='OpenFabrics Alliance InfiniBand network diagnostic and testing utilities'
arch=('x86_64' 'i686')
url='https://www.openfabrics.org/index.php/overview.html'
license=('GPL2' 'custom:"OpenIB.org BSD"')
depends=('opensm' 'tk' 'perl')
source=("https://www.openfabrics.org/downloads/${pkgname}/${pkgname}-${pkgver}-${_pkgver_subver}.${_pkgver_commit}.tar.gz")
sha256sums=('67a3b417c8d0820400045dd7143674824086c6793a40ded333be50e498d9a703')

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
