# Maintainer: Evgeniy Alekseev <arcanis at archlinux dot org>

pkgname=plasma5-applet-awesome-widgets
_pkgname=awesome-widgets
pkgver=2.4.0
pkgrel=1
pkgdesc="Collection of minimalistic Plasmoids which look like Awesome WM widgets (ex-PyTextMonitor)"
arch=('i686' 'x86_64')
url="http://arcanis.name/projects/awesome-widgets"
license=('GPL3')
depends=('plasma-framework')
optdepends=("catalyst: for GPU monitor"
            "hddtemp: for HDD temperature monitor"
            "smartmontools: for HDD temperature monitor"
            "mpd: for music player monitor"
            "nvidia-utils: for GPU monitor")
makedepends=('cmake' 'extra-cmake-modules')
source=(https://github.com/arcan1s/awesome-widgets/releases/download/V.${pkgver}/${_pkgname}-${pkgver}-src.tar.xz)
install=${pkgname}.install
md5sums=('9b870da6ecefef584f11b6ba6bf9a397')
backup=('etc/xdg/plasma-dataengine-extsysmon.conf')

prepare() {
  rm -rf "${srcdir}/build"
  mkdir "${srcdir}/build"
}

build () {
  cd "${srcdir}/build"
  cmake -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        "../${_pkgname}"
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
}
