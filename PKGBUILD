# Maintainer: Fabian Maurer <dark.shadow4@web.de>

pkgname=plasma-pk-updates-git
pkgver=r174.175927e
pkgrel=1
pkgdesc="Plasma5 applet for software updates using PackageKit"
arch=('any')
url="https://invent.kde.org/system/plasma-pk-updates.git"
license=('GPL')
depends=('packagekit' 'plasma-workspace' 'kdoctools' 'kdesignerplugin' 'packagekit-qt5')
makedepends=('git' 'extra-cmake-modules')
source=('git+https://invent.kde.org/system/plasma-pk-updates.git')
md5sums=('SKIP')

pkgver() {
	cd ${srcdir}/plasma-pk-updates
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${srcdir}/plasma-pk-updates
  mkdir build
}

build() {
  cd ${srcdir}/plasma-pk-updates/build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
}

package() {
  cd ${srcdir}/plasma-pk-updates/build
  make DESTDIR="$pkgdir/" install
}
