# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=cairo-clock
pkgver=0.3.4
pkgrel=4
pkgdesc='An analog clock displaying the system-time'
arch=('i686' 'x86_64')
url='http://macslow.org'
license=('GPL')
depends=('libglade' 'librsvg')
makedepends=('intltool')
source=("http://ftp.de.debian.org/debian/pool/main/c/cairo-clock/${pkgname}_${pkgver}.orig.tar.gz"
        'cairo-clock.patch')
md5sums=('78e5b3aa3492aa6c182eaacae63a7c03'
         'a2ec378bf79dfb9a1b1418d7b2d341ff')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  patch -Np0 -i ../cairo-clock.patch

  # quick and dirty build fix, a proper patch was submitted upstream and is
  # pending approval
  sed -ie 's/-Wl, --export-dynamic/-Wl,--export-dynamic/g' src/Makefile*

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make prefix="${pkgdir}/usr" install
} 
