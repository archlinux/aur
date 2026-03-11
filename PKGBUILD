# Maintainer: Stickynotememo <samk26633@gmail.com>
# Contributor: Rooki <aur at rooki dot xyz>
# Contributor: Brian Bidulock <bidulock@openss7.org>

pkgname=cairo-clock
pkgver=0.3.4
pkgrel=6
pkgdesc='An analog clock displaying the system-time'
arch=('i686' 'x86_64')
url='https://launchpad.net/cairo-clock'
license=('GPL')
depends=('libglade' 'librsvg')
makedepends=('intltool')
source=("https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/${pkgname}/${pkgver}-2ubuntu2/${pkgname}_${pkgver}.orig.tar.gz")
md5sums=('78e5b3aa3492aa6c182eaacae63a7c03')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  sed -ie 's/-Wl, --export-dynamic/-Wl,--export-dynamic/g' src/Makefile*

  export LDFLAGS="$LDFLAGS -lm"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make prefix="${pkgdir}/usr" install
} 
