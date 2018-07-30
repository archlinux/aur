# Maintainer: Cihan Alkan <cihanalk@gmail.com>

pkgname=ukwm
pkgver=v1.1.8+1+gaa7eb3a
pkgrel=1
pkgdesc="UKUI Pencere Yöneticisi"
url="https://mate-desktop.org"
arch=('x86_64')
license=('GPL')
depends=(dconf gobject-introspection-runtime gsettings-desktop-schemas libcanberra
         startup-notification zenity libsm gnome-desktop upower libxkbcommon-x11
         ukui-settings-daemon libgudev libinput cogl clutter pipewire)
makedepends=(intltool gobject-introspection git)
optdepends=()
groups=('ukui')

source=("git+https://github.com/ukui/ukwm.git")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}
prepare() {
 cd ${pkgname}
    NOCONFIGURE=1 ./autogen.sh
}

build() {
 cd ${pkgname}
./configure --prefix=/usr \
--disable-static \
--enable-gtk-doc \
--enable-compile-warnings=minimum
make
}

package() {
 cd ${pkgname}
    make DESTDIR="${pkgdir}" install
}
