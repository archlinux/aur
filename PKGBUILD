# Maintainer: Fábio Melo Pfeifer <fmpfeifer@gmail.com>

pkgname=sleuthkit-apfs
_pkgname=sleuthkit-APFS
pkgver=4.6.5
pkgrel=3
pkgdesc='File system and media management forensic analysis tools with APFS patches'
arch=('x86_64')
url="https://www.sleuthkit.org/sleuthkit"
license=('GPL2' 'CPL' 'custom:"IBM Public Licence"')
depends=('perl' 'libewf' 'sqlite')
makedepends=('ant')
provides=('sleuthkit')
conflicts=('sleuthkit')
source=('git+https://github.com/lfcnassif/sleuthkit-APFS.git')
sha256sums=('SKIP')

build() {
  cd ${_pkgname}
  ./bootstrap

  ./configure --prefix=/usr
  make
}

package() {
  cd ${_pkgname}

  make DESTDIR="${pkgdir}" install

#licenses
  install -d "${pkgdir}"/usr/share/licenses/${_pkgname}
  install -Dm0644 licenses/* "${pkgdir}"/usr/share/licenses/${_pkgname}
}
