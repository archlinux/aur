# Maintainer: Luis Bocanegra <luisbocanegra17b at gmail dot com>
_gitname=plasma-audio-visualizer
pkgname=plasma6-applets-plasma-audio-visualizer
pkgver=0.3.0
pkgrel=2
pkgdesc="Audio visualizer widget powered by CAVA for the KDE Plasma Desktop"
arch=('any')
url="https://github.com/luisbocanegra/$_gitname"
license=('GPL3')
depends=('plasma-workspace' 'python' 'python-websockets' 'qt6-websockets')
makedepends=('gcc' 'extra-cmake-modules')
source=("${_gitname}-${pkgver}.tar.gz::$url/archive/v${pkgver}/${_gitname}-${pkgver}.tar.gz")
sha256sums=('9160e8f4b7929a6a7d8a104920429eccd2fe5a9c3e674f47b36f663654429ca1')

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
