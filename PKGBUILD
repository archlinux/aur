# Maintainer: Xinc

pkgname=unity-indicator-sound
_actual_name=indicator-sound
_actual_ver=12.10.2
_extra_ver=+18.10.20180612
pkgver=${_actual_ver}${_extra_ver/\+/.}
pkgrel=1
pkgdesc="System sound indicator used by the Unity7 user interface"
arch=(x86_64)
url="https://launchpad.net/indicator-sound"
license=(GPL)
depends=(unity-api dbus qt5-declarative libxml2 gobject-introspection dconf libindicator-gtk3 libnotify gsettings-ubuntu-touch-schemas accountsservice pulseaudio libgee)
makedepends=(systemd gnome-common cmake-extras glibc glib2)
group=(unity-indicators-meta)
source=("https://launchpad.net/ubuntu/+archive/primary/+files/indicator-sound_${_actual_ver}${_extra_ver}.orig.tar.gz")
sha512sums=('SKIP')

prepare() {
  sed -i "/add_definitions(/a -DVALA_EXTERN=extern" src/CMakeLists.txt
  sed -i "/add_subdirectory(po)/d" CMakeLists.txt
}

build() {
 cmake -B build -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LOCALSTATEDIR=/var -DVALA_COMPILER=${VALAC} -DVAPI_GEN=${VAPIGEN} -DCMAKE_INSTALL_FULL_DATADIR=/usr/share -Wno-dev -G Ninja
 cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}



