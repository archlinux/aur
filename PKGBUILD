pkgname=calibrate-joystick-gui
pkgver=0.6.0
pkgrel=2
pkgdesc="A graphical program to quickly calibrate range and deadzones of joysticks"
arch=('x86_64')
url="https://github.com/dkosmari/calibrate-joystick/"
license=('GPL-3.0-or-later')
depends=('gtk3' 'gtkmm3' 'libevdev' 'gcc-libs' 'libgudev' 'libc++' 'glibc')
makedepends=('make' 'autoconf' 'automake' 'intltool' 'libtool' 'pkgconf' 'gettext' 'gcc' 'git')
options=('!debug')
source=("git+https://github.com/dkosmari/calibrate-joystick.git#tag=v${pkgver}")
sha256sums=('3845b442c181e3c89eeb6c5bc67412a2f2122164893241072304eb5b41525143')
_srcname="${pkgname%-gui}"

prepare() {
   cd "${srcdir}/${_srcname}"
   git submodule init
   git submodule update
   ./bootstrap
   ./configure --prefix=/usr
}

build() {
   cd "${srcdir}/${_srcname}"
   make
}

package() {
   cd "${srcdir}/${_srcname}"
   make DESTDIR="${pkgdir}" install
}
