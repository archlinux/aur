# Maintainer: Luis Bocanegra <luisbocanegra17b at gmail dot com>
_gitname=kurve
pkgname=plasma6-applets-kurve
pkgver=1.1.0
pkgrel=1
pkgdesc="Audio visualizer widget powered by CAVA for the KDE Plasma Desktop"
arch=('any')
url="https://github.com/luisbocanegra/$_gitname"
license=('GPL3')
depends=('libplasma' 'cava' 'python' 'python-websockets' 'qt6-websockets')
makedepends=('gcc' 'extra-cmake-modules')
source=("${_gitname}-${pkgver}.tar.gz::$url/archive/v${pkgver}/${_gitname}-${pkgver}.tar.gz")
sha256sums=('cb9e01b0d879fb4032068c9179f92d38da47b7118463151c9cf8c36eec1b2e23')
provides=('plasma6-applets-plasma-audio-visualizer' 'plasma6-applets-kurva')
conflicts=('plasma6-applets-plasma-audio-visualizer' 'plasma6-applets-kurva')

build() {
  cd "${srcdir}/${_gitname}-$pkgver" || exit
  python ./kpac i18n --no-merge
  cmake -B build -S . -DINSTALL_PLASMOID=ON -DBUILD_PLUGIN=ON
  cmake --build build
}

package() {
  cd "${srcdir}/${_gitname}-$pkgver" || exit
  DESTDIR="$pkgdir" cmake --install build
  chmod 755 "$pkgdir/usr/share/plasma/plasmoids/luisbocanegra.audio.visualizer/contents/ui/tools/commandMonitor"
}
