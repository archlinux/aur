# Maintainer: detrito <detrito@inventati.org>

pkgname=therion
pkgver=5.3.16
pkgrel=1
pkgdesc="A cave surveying software"
arch=('x86_64' 'i686')
url="http://therion.speleo.sk"
license=('GPL2')

depends=('tk' 'bwidget' 'texlive-core' 'imagemagick' 'wxgtk' 'glu'
  'vtk' 'webkitgtk2')

optdepends=('libjpeg-turbo' 'libpng' 'zlib')
source=("${url}/downloads/${pkgname}-${pkgver}.tar.gz"
	"loch-makefile-vtk-6.1.patch"
	"makefile-install-path.patch"
	"therion-ini.patch")

sha256sums=('73cda5225725d3e8cadd6fada9e506ab94b093d4e7a9fc90eaf23f8c7be6eb85'
  'd737140a4174d5b6cb55095a84010667e6bcbc2a645a1758229a422dd9daa742'
  '9944238d0ade161143b04446b98f1627f2a20e33f29c8f9135f5d051e5af2c1e'
  '85129bd20f12349fc7da91b262148c6c58265982fe07322b6f89cdb75e4bb5cd')

build() {
  # patch to compile loch with VTK 6.1
  cd "${srcdir}/${pkgname}/loch"
  patch -p0 -i ${srcdir}/loch-makefile-vtk-6.1.patch
  # patch to install in $pkgdir
  cd ${srcdir}/${pkgname}
  patch -p0 -i ${srcdir}/makefile-install-path.patch
  
  # patch config file
  patch -p0 -i ${srcdir}/therion-ini.patch
 
make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" install
}
