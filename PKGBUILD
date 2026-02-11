# Maintainer: Luis Bocanegra <luisbocanegra17b at gmail dot com>
_gitname=plasma-panel-colorizer
pkgname=plasma6-applets-panel-colorizer
pkgver=6.8.0
pkgrel=1
pkgdesc="Latte-Dock and WM status bar customization features for the KDE Plasma panels"
arch=('any')
url="https://github.com/luisbocanegra/plasma-panel-colorizer"
license=('GPL-3.0-or-later')
depends=('libplasma' 'python' 'python-dbus')
makedepends=('gcc' 'extra-cmake-modules' 'gettext')
optdepends=('spectacle: take preset preview support')
source=("${_gitname}-${pkgver}.tar.gz::$url/archive/v${pkgver}/${_gitname}-${pkgver}.tar.gz")
sha256sums=('aaf9ad166e53321d571a274985c328f44d45f5f91b9e00b7ac69d6bdae1e8f8f')

build() {
  cd "${srcdir}/${_gitname}-$pkgver"
  python ./kpac i18n --no-merge
  cmake -B build -S . -DINSTALL_PLASMOID=ON -DBUILD_PLUGIN=ON
  cmake --build build
}

package() {
  cd "${srcdir}/${_gitname}-$pkgver"
  DESTDIR="$pkgdir" cmake --install build
  chmod 755 "$pkgdir/usr/share/plasma/plasmoids/luisbocanegra.panel.colorizer/contents/ui/tools/list_presets.sh"
  chmod 755 "$pkgdir/usr/share/plasma/plasmoids/luisbocanegra.panel.colorizer/contents/ui/tools/gdbus_get_signal.sh"
}
