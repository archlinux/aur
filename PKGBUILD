# Maintainer: Luis Bocanegra <luisbocanegra17b at gmail dot com>
_gitname=kurve
pkgname=plasma6-applets-kurve
pkgver=3.5.1
pkgrel=1
pkgdesc="Audio visualizer widget powered by CAVA for the KDE Plasma Desktop"
arch=('any')
url="https://github.com/luisbocanegra/kurve"
license=('GPL-3.0-or-later')
depends=('libplasma' 'cava' 'python' 'python-websockets' 'qt6-websockets')
makedepends=('gcc' 'extra-cmake-modules' 'gettext')
source=("${_gitname}-${pkgver}.tar.gz::$url/archive/v${pkgver}/${_gitname}-${pkgver}.tar.gz")
sha256sums=('b34e675e2cba54d65b2520308dbaba820793936fef8bde61190b98e66a09754e')

build() {
  cd "${srcdir}/${_gitname}-$pkgver"
  python ./kpac i18n --no-merge
  cmake -B build -S . -DINSTALL_PLASMOID=ON -DBUILD_PLUGIN=ON
  cmake --build build
}

package() {
  cd "${srcdir}/${_gitname}-$pkgver"
  DESTDIR="$pkgdir" cmake --install build
  chmod 755 "$pkgdir/usr/share/plasma/plasmoids/luisbocanegra.audio.visualizer/contents/ui/tools/commandMonitor"
}
