# Maintainer:  Marcin Wieczorek <marcin@marcin.co>
# Contributor: ovi chis <ovi@ovios.org>

pkgname=libqb
pkgver=1.0.1
pkgrel=1
pkgdesc='Library with the primary purpose of providing high performance client server reusable features'
arch=("i686" "x86_64" "mips64el")
makedepends=("doxygen" "splint")
license=("LGPL2.1")
options=(!libtool)
url="https://github.com/ClusterLabs/${pkgname}"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ClusterLabs/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('70b9b8361dbb93694a2db97b7db0644ebfe2b45ba7f9caf3e04a7c5b10aaa22ee9177f3491af55723010b8b3d3ce75bda79f1771df5cb63b562156edff9ce1e8')

build() {
cd "${srcdir}/${pkgname}-${pkgver}"
  setarch ${CARCH} ./autogen.sh
  setarch ${CARCH} ./configure --prefix=/usr\
    --disable-fatal-warnings\
    --disable-static\
    --libdir=/usr/lib\
    --sbindir=/usr/bin
  setarch ${CARCH} make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  setarch ${CARCH} make DESTDIR="${pkgdir}" install
}
