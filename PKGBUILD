# Maintainer: Winston Astrachan <winston dot astrachan at gmail dot com>
# Contributer: bwrsandman

pkgname=gestures
pkgver=0.2.3
pkgrel=1
pkgdesc='Modern, minimal GUI app for libinput-gestures'
arch=('any')
url='https://gitlab.com/cunidev/gestures'
license=('GPL3')
depends=('hicolor-icon-theme' 'libinput-gestures' 'python' 'python-gobject')
makedepends=('python-setuptools')
optdepends=('xdotool: Simulate keyboard input or mouse activity')
source=("https://gitlab.com/cunidev/gestures/-/archive/${pkgver}/gestures-${pkgver}.tar.gz")
sha256sums=('5ddfa9da49d154b8031093decd14891442e9c6b6ff5424ffa676ff1bc94bc929')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed -i "s/org.cunidev.gestures.desktop/${pkgname}.desktop/" setup.py
    mv "data/org.cunidev.gestures.desktop" "data/${pkgname}.desktop"
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
