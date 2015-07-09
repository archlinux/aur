# Maintainer: Jonathan Kotta <jpkotta at gmail dot com>

# This is a modified version of the original cairo-clock PKGBUILD by Lukas Fleischer.

pkgname=cairo-clock-ccw
_origname=cairo-clock
pkgver=0.3.4
pkgrel=1
pkgdesc='An analog clock displaying the system-time, running counter-clockwise.'
arch=('i686' 'x86_64')
url='http://macslow.thepimp.net/?page_id=23'
license=('GPL')
depends=('cairo' 'libglade>=2.6.0' 'librsvg>=2.14.0')
makedepends=('intltool')
conflicts=("cairo-clock")
source=("http://ftp.de.debian.org/debian/pool/main/c/cairo-clock/${_origname}_${pkgver}.orig.tar.gz"
        'cairo-clock.patch'
        'ccw.patch')
md5sums=('78e5b3aa3492aa6c182eaacae63a7c03'
         'a2ec378bf79dfb9a1b1418d7b2d341ff'
         '621199b7064b4e53ecc4740bfe4bf404')

build() {
  cd "${srcdir}/${_origname}-${pkgver}"

  patch -Np0 -i ../cairo-clock.patch
  patch -Np1 -i ../ccw.patch

  # quick and dirty build fix, a proper patch was submitted upstream and is
  # pending approval
  sed -ie 's/-Wl, --export-dynamic/-Wl,--export-dynamic/g' src/Makefile*

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_origname}-${pkgver}"
  make prefix="${pkgdir}/usr" install
} 
