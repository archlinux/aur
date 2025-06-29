# Maintainer: Luis Bocanegra <luisbocanegra17b at gmail dot com>
_gitname=kurva
pkgname=plasma6-applets-kurva
pkgver=0.3.0
pkgrel=1
pkgdesc="Audio visualizer widget powered by CAVA for the KDE Plasma Desktop"
arch=('any')
url="https://github.com/luisbocanegra/$_gitname"
license=('GPL3')
depends=('libplasma' 'cava' 'python' 'python-websockets' 'qt6-websockets')
makedepends=('gcc' 'extra-cmake-modules')
source=("${_gitname}-${pkgver}.tar.gz::$url/archive/v${pkgver}/${_gitname}-${pkgver}.tar.gz")
sha256sums=('4aeeb0341e17cce3b4d3ca488b92abfbdb3dbaf3dd2d4c3a811305026a2198f5')
provides=('plasma6-applets-plasma-audio-visualizer')
conflicts=('plasma6-applets-plasma-audio-visualizer')

build() {
  cd "${srcdir}/${_gitname}-$pkgver" || exit
  cmake -B build -S . -DINSTALL_PLASMOID=ON -DBUILD_PLUGIN=ON
  cmake --build build
}

package() {
  cd "${srcdir}/${_gitname}-$pkgver" || exit
  DESTDIR="$pkgdir" cmake --install build
  chmod 755 "$pkgdir/usr/share/plasma/plasmoids/luisbocanegra.audio.visualizer/contents/ui/tools/commandMonitor"
}
