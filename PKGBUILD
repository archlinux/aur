# Maintainer: Geballin - Guillaume Ballin <macniaque at free dot fr>
pkgname=iwidgets
pkgver=4.1.1
pkgrel=2
pkgdesc="A megawidget set based on [incr Tcl] and [incr Tk]"
url="https://sourceforge.net/projects/incrtcl/"
arch=('x86_64' 'i686')
license=('BSD')
depends=('tcl' 'tk' 'tk-itk')
optdepends=()
makedepends=(make gcc)
conflicts=()
replaces=()
backup=()
install=
itkvers=4.1.0
source=("https://sourceforge.net/projects/incrtcl/files/%5BIncr%20Widgets%5D/${pkgver}/${pkgname}-${pkgver}.tar.gz"
	"https://sourceforge.net/projects/incrtcl/files/%5Bincr%20Tcl_Tk%5D-4-source/itcl%20${pkgver}/itcl${pkgver}.tar.gz"
	"https://sourceforge.net/projects/incrtcl/files/%5Bincr%20Tcl_Tk%5D-4-source/itk%20${itkvers}/itk${itkvers}.tar.gz")

md5sums=(cca62e022b0d561a2bba19bd56ecc667
	198c9adb83550ffe87dbffaa5676ef54
	600df0a12868507c52d46fd59d4e1c16)

build() {
  cd ${srcdir}/itcl${pkgver}
  ./configure
  make
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr --with-itcl=${srcdir}/itcl${pkgver} --with-itk=${srcdir}/itk${itkvers}
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
