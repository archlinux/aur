# Original Maintainer: fabien Cellier <fabien.cellier@@gmail.com>
# Imported to AUR4: Olaf Leidinger <oleid@mescharet.de>

_pkgname=pocl
pkgname=$_pkgname
#pkgname=$_pkgname-bzr
pkgver=0.12
pkgrel=1
pkgdesc="Portable OpenCL is an open-source implementation of OpenCL which can be easily adapted for new targets"
arch=(i686 x86_64)
url="https://launchpad.net/pocl"
license=('GPL')
depends=('clang' 'libcl' 'hwloc' 'libltdl' 'opencl-headers')
source=("http://pocl.sourceforge.net/downloads/${_pkgname}-${pkgver}.tar.gz")
md5sums=('e197ba3aa01a35f40581c48e053330dd')
options=(debug strip !staticlibs !libtool)
# pocl use pkg-config to find OpenCL, which is only provided in ocl-icd
makedepends=('ocl-icd' 'pkg-config')

build() {
  cd "$srcdir/${_pkgname}-${pkgver}"

  #
  # BUILD HERE
  #
  ./configure --enable-shared --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  make DESTDIR="$pkgdir/" install
  rm -rf "$pkgdir/usr/include/CL"
}
