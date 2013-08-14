# Contributor: Jan de Groot <jgc@archlinux.org>
# Maintainer: Florian Bruhin (The-Compiler) <archlinux.org@the-compiler.org>

pkgname=('poppler-minimal')
pkgver=0.22.5
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
source=(http://poppler.freedesktop.org/poppler-${pkgver}.tar.gz)
md5sums=('1cd27460f7e3379d1eb109cfd7bcdb39')

build() {
  cd "${srcdir}/poppler-${pkgver}"

  sed -i -e '/AC_PATH_XTRA/d' configure.ac
  sed -i "s:AM_CONFIG_HEADER:AC_CONFIG_HEADERS:" configure.ac
  autoreconf -fi

  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static \
      --without-x \
      --disable-splash-output \
      --disable-poppler-cpp \
      --disable-libpng \
      --enable-cms=none \
      --disable-cairo-output
  make
}

package() {
  cd "${srcdir}/poppler-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

