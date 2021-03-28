# Maintainer: Winston Astrachan <winston dot astrachan at gmail dot com>
# Contributer: bwrsandman

pkgname=gestures
pkgver=0.2.5
pkgrel=2
pkgdesc='Modern, minimal GUI app for libinput-gestures'
arch=('any')
url='https://gitlab.com/cunidev/gestures'
license=('GPL3')
depends=('dconf' 'hicolor-icon-theme' 'libinput-gestures' 'python' 'python-gobject')
makedepends=('meson' 'ninja' 'gettext')
optdepends=('xdotool: Simulate keyboard input or mouse activity')
source=("https://gitlab.com/cunidev/gestures/-/archive/${pkgver}/gestures-${pkgver}.tar.gz")
sha256sums=('354c6b9f56d8f9f64f9f4d72ad984628bb4cdd32e361d5e452de47c7c81f2a45')

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
    meson test -C build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  DESTDIR="$pkgdir" meson install -C build --no-rebuild
}
