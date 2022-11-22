# $Id$
# Maintainer: Fernando Fernandez <fernando@softwareperonista.com.ar>

_project_name=rockarrolla
pkgname=${_project_name}-git
pkgver=1.4.r0.g71f6041
pkgrel=1
pkgdesc='A simple jukebox emulator'
arch=('x86_64')
license=('GPL3')
url='https://gitlab.com/softwareperonista/rockarrolla'
depends=('libadwaita' 'doctrina' 'gst-plugins-good' 'gxml' 'qrencode')
makedepends=('meson' 'vala')
conflicts=('rockarrolla')
source=('git+https://gitlab.com/softwareperonista/rockarrolla.git')
sha256sums=('SKIP')

pkgver() {
  cd ${_project_name}
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${_project_name}

  arch-meson . build

  ninja -C build
}

package() {
  cd ${_project_name}

  DESTDIR="$pkgdir" ninja -C build install
}
