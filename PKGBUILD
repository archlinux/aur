# $Id$
# Maintainer: Fernando Fernandez <fernando@softwareperonista.com.ar>

_project_name=rockarrolla
pkgname=${_project_name}-git
pkgver=0.0.1.r362.g8eea847
pkgrel=2
pkgdesc='A simple jukebox emulator'
arch=('x86_64')
license=('GPL3')
url='https://gitlab.com/softwareperonista/rockarrolla'
depends=('taglib' 'gstreamer' 'gtk4' 'doctrina' 'gst-plugins-good')
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
