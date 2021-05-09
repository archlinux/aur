# Maintainer: Winston Astrachan <winston dot astrachan at gmail dot com>
# Contributer: bwrsandman

pkgname=gestures
pkgver=0.2.6
pkgrel=1
pkgdesc='Modern, minimal GUI app for libinput-gestures'
arch=('any')
url='https://gitlab.com/cunidev/gestures'
license=('GPL3')
depends=('dconf' 'hicolor-icon-theme' 'libinput-gestures' 'python' 'python-gobject')
makedepends=('meson' 'ninja' 'gettext')
optdepends=('xdotool: Simulate keyboard input or mouse activity')
source=("https://gitlab.com/cunidev/gestures/-/archive/${pkgver}/gestures-${pkgver}.tar.gz")
sha256sums=('283fb84d25cf17978330bf9955d5f49b0da112de49bddaeb326ddcfd473caf26')

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
