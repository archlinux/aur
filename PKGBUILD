# Maintainer: CUI Hao <cuihao.leo@gmail.com>

_pkgname=workrave
pkgname=workrave-git
pkgver=1.11.0_beta.10.13.gabf7bec
pkgrel=1
pkgdesc="Assist in the recovery and prevention of Repetitive Strain Injury (RSI)"
arch=('x86_64')
url="https://workrave.org/"
license=('GPL-3.0-only')
depends=('gstreamer' 'gtkmm3' 'libxss' 'spdlog' 'libayatana-appindicator')
provides=('workrave')
conflicts=('workrave')
makedepends=(
    'git' 'cmake' 'gobject-introspection' 'libpulse' 'boost' 'python-jinja'
    # For DE panel applets. Comment out if not needed.
    'gnome-panel' 'mate-panel' 'xfce4-panel'
)
optdepends=(
    'gst-plugins-good: to play sound events'
    'gnome-panel: Applet for GNOME Panel'
    'mate-panel: Applet for MATE Panel'
    'xfce4-panel: Applet for Xfce4 Panel'
)
source=("${_pkgname}::git+https://github.com/rcaelers/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --abbrev=7 | sed -E 's/^v//; s/-/./g; s/_([0-9])/.\1/g'
}

build() {
  cmake -B build -S "${_pkgname}" -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
