# Maintainer: mickele
pkgname=tclreadline
pkgver=2.1.0
pkgrel=1
pkgdesc="tclreadline makes the GNU readline library available for interactive tcl shells, including history expansion and file/command completion"
url="http://tclreadline.sourceforge.net/"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('tcl')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install=''
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz" "alloc-invalid-block.patch")

# http://downloads.sourceforge.net/project/tclreadline/tclreadline/tclreadline-2.1.0/tclreadline-2.1.0.tar.gz?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Ftclreadline%2Ffiles%2Ftclreadline%2Ftclreadline-2.1.0%2F&ts=1454875147&use_mirror=netix

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  autoreconf -ivf
  patch -Np1 -i "${srcdir}/alloc-invalid-block.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr \
              --with-tcl=/usr/lib \
	      --with-tcl-includes=/usr/include/tcl
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
md5sums=('219d0247a1373578080940ebde53bdd0'
         'd8e746f6a02624aa752a946bc5348b5e')
