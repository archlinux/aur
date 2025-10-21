# Maintainer: Luis Bocanegra <luisbocanegra17b at gmail dot com>
_gitname=kurve
pkgname=plasma6-applets-kurve
pkgver=2.2.0
pkgrel=1
pkgdesc="Audio visualizer widget powered by CAVA for the KDE Plasma Desktop"
arch=('any')
url="https://github.com/luisbocanegra/kurve"
license=('GPL-3.0-or-later')
depends=('libplasma' 'cava' 'python' 'python-websockets' 'qt6-websockets')
makedepends=('gcc' 'extra-cmake-modules' 'gettext')
source=("${_gitname}-${pkgver}.tar.gz::$url/archive/v${pkgver}/${_gitname}-${pkgver}.tar.gz")
sha256sums=('11c7e2aa29526ba73104268d507e8989d0c34389564f21e6bebcc9f8d67a8e00')

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
