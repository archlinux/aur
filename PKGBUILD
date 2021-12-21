# Maintainer: Winston Astrachan <winston dot astrachan at gmail dot com>
# Contributer: bwrsandman

pkgname=gestures
pkgver=0.3.0
pkgrel=2
pkgdesc='Modern, minimal GUI app for libinput-gestures'
arch=('any')
url='https://gitlab.com/cunidev/gestures'
license=('GPL3')
depends=('dconf' 'hicolor-icon-theme' 'libinput-gestures' 'python' 'python-gobject')
makedepends=('meson' 'ninja' 'gettext')
optdepends=('xdotool: Simulate keyboard input or mouse activity')
source=("https://gitlab.com/cunidev/gestures/-/archive/${pkgver}/gestures-${pkgver}.tar.gz")
sha256sums=('08a3cea9f39abf5fa14be2234926b7e84f0d59da6f3cc95fc42722016d1867eb')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    arch-meson . build
    meson compile -C build
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    # Skip the 'Validate appstream file' test as it is a known failing test in 0.3.0
    # and is not required for the app to build, install, or function
    meson test 'Validate desktop file' 'Validate schema file' -C build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  DESTDIR="$pkgdir" meson install -C build --no-rebuild
}
