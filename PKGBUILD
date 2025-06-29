# Maintainer: Luis Bocanegra <luisbocanegra17b at gmail dot com>
_gitname=kurva
pkgname=plasma6-applets-kurva
pkgver=0.3.1
pkgrel=1
pkgdesc="Audio visualizer widget powered by CAVA for the KDE Plasma Desktop"
arch=('any')
url="https://github.com/luisbocanegra/$_gitname"
license=('GPL3')
depends=('libplasma' 'cava' 'python' 'python-websockets' 'qt6-websockets')
makedepends=('gcc' 'extra-cmake-modules')
source=("${_gitname}-${pkgver}.tar.gz::$url/archive/v${pkgver}/${_gitname}-${pkgver}.tar.gz")
sha256sums=('7f6c2d006ea049fbb189a5b75894db7d40622ae98955924957dfec10d6148db2')
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
