pkgname=digikam-git
pkgver=r30759.aa59cf9
pkgrel=1
pkgdesc='Digital photo management application for KDE'
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.digikam.org/"
depends=('kdebase-runtime' 'kdepimlibs' 'libgphoto2' 'opencv' 'liblqr'
         'libkipi-git' 'libkexiv2-git' 'libkdcraw-git' 'libkface-git' 'libkgeomap-git' 'lensfun' 
	 'libpgf' 'libbaloo4')
optdepends=('kipi-plugins: more tools and plugins' 'kdebase-workspace: Theme configuration dialog')
conflicts=('digikam')
provides=('digikam')
install=digikam-git.install
source=('git://anongit.kde.org/digikam.git')
md5sums=('SKIP')

pkgver() {
  cd digikam
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
if [[ -d ${srcdir}/build ]]; then
      msg "Cleaning the previous build directory..."
      rm -rf ${srcdir}/build
  fi
  mkdir ${srcdir}/build
}

build() {
  cd ${srcdir}/build
  cmake  ../digikam -DCMAKE_BUILD_TYPE=Release \
		-DKDE4_BUILD_TESTS=OFF \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DDIGIKAMSC_USE_PRIVATE_KDEGRAPHICS=OFF \
		-DDIGIKAMSC_USE_PRIVATE_SHAREDLIBS=ON
}

package() {
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install
}
