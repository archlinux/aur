# Maintainer: Aleix Quintana Alsius <kinta@communia.org>
pkgname=plasma-icinga-git
_pkgname=${pkgname%-git}
pkgver=6.0.3
pkgrel=1
pkgdesc="A KDE Plasma dataengine and an applet to view the collected data coming from an icinga server."
arch=(any)
url="https://invent.kde.org/kinta/plasma-icinga"
license=('GPL')
depends=(
  plasma-workspace
  kitemmodels
  kdeclarative
  qt6-charts
)
makedepends=(cmake extra-cmake-modules git)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

build() {
	cmake -B build -S "${_pkgname}" -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
        cmake --build build
}

package() {
        #cd ${_pkgname}
	DESTDIR="$pkgdir/" cmake --install build
	#install -Dm644 -t ${pkgdir}/usr/share/licenses/${pkgname}/ LICENSE.txt
}

pkgver() {
	cd ${_pkgname}
	cat CMakeLists.txt | awk -F "\"" '/set\(PROJECT_VERSION/{print $2}'
}
