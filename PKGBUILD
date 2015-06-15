# Contributor: Jan de Groot <jgc@archlinux.org>
# Maintainer: Florian Bruhin (The-Compiler) <archlinux.org@the-compiler.org>
# vim: set ts=2 sts=2 et ft=sh tw=79:

pkgname='poppler-minimal'
pkgver=0.30.0
pkgrel=2
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
sha1sums=('12937666faee80bae397a8338a3357e864d77d53')

build() {
  cd "${srcdir}/poppler-${pkgver}"
  autoreconf -fi
  ./configure \
      --prefix=/usr \
      --sysconfdir=/etc \
      --localstatedir=/var \
      --disable-static \
      --without-x \
      --disable-splash-output \
      --disable-poppler-cpp \
      --disable-libpng \
      --enable-cms=none \
      --disable-cairo-output \
      --disable-libjpeg \
      --enable-libopenjpeg=none
  make
}

package() {
  cd "${srcdir}/poppler-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
sha1sums=('6040e46b5f27e2562227232ba956c815cc2878e2')
