# Contributor: Jan de Groot <jgc@archlinux.org>
# Maintainer: Paolo Stivanin <info{ATCHAR}paolostivanin{THEREISADOT}com>
# vim: set ts=2 sts=2 et ft=sh tw=79:

pkgname='poppler-minimal'
pkgver=0.53.0
pkgrel=1
arch=(i686 x86_64)
license=('GPL')
makedepends=('icu')
options=('!libtool' '!emptydirs')
pkgdesc="PDF rendering library based on xpdf 3.0 (minimal non-X version)"
depends=('fontconfig' 'gcc-libs')
conflicts=("poppler")
provides=("poppler")
url="http://poppler.freedesktop.org/"
source=(http://poppler.freedesktop.org/poppler-${pkgver}.tar.xz)
md51sums=('943679f1030b9bc19a989f24121a282a')

build() {
  cd "${srcdir}/poppler-${pkgver}"
  autoreconf -fi
  ./configure --prefix=/usr --sysconfdir=/etc --disable-static --enable-build-type=release --enable-cmyk --enable-xpdf-headers
  make
}

package() {
  cd "${srcdir}/poppler-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
