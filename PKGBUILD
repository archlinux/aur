# Maintainer: xeruf <27jf at pm dot me>
# Maintainer: Philipp Schmidt <philschmidt@gmx.net>
# Creator: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

pkgname="${_pkgname}-git"
_pkgname=samba-mounter
pkgname=samba-mounter-git
pkgver=207.0c56c2d
pkgrel=1
pkgdesc="User space mount tool for samba"
url="https://invent.kde.org/system/samba-mounter.git/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('kauth' 'cifs-utils' 'smbclient' 'kcmutils' 'kconfig' 'kio' 'ki18n' 'solid')
makedepends=('cmake' 'git' 'extra-cmake-modules')
provides=("${_pkgname}"  "${_pkgname}-frameworks-git")
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	echo "$(git rev-list --count HEAD).$(git describe --always)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../${_pkgname} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
