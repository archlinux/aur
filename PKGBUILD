# Maintainer: detrito <detrito@inventati.org>

pkgname=therion
pkgver=5.4.0
pkgrel=1
pkgdesc="A cave surveying software"
arch=('x86_64' 'i686')
url="http://therion.speleo.sk"
license=('GPL2')

# avoid parallel-execution errors
MAKEFLAGS="-j1"

depends=('tk' 'bwidget' 'texlive-core' 'imagemagick' 'wxgtk' 'glu' 'vtk'
	'webkitgtk2')

optdepends=('libjpeg-turbo' 'libpng' 'zlib')

source=("http://github.com/therion/therion/archive/v${pkgver}.tar.gz"
	"loch_vtk7.patch"
	"make_install.patch"
	"therion_ini.patch")

sha256sums=('0d505093fedfc0a3cfda865407067d19c1aca9e6d1823b4007d373f6e14e48cd'
	'81cd6c75a74897831edd4116bb97c71090023abbb14725b96d2a219f67cb5613'
	'bf3fda048fb1a4f4c49f0daf7faa7e40c630748b33ed27c47bcfabba4014571c'
	'0639b0c4c9660af33675bf948ca4678d441167f77f7818cc015b7738a53fb8f3'
	)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # patch to compile loch with VTK 7.1
  patch -p0 -i ${srcdir}/loch_vtk7.patch

  # patch to install in $pkgdir
  patch -p0 -i ${srcdir}/make_install.patch

  # patch to get UTF8 and available fonts
  patch -p0 -i ${srcdir}/therion_ini.patch

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
