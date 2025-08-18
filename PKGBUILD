# Maintainer: patrickjaja <patrickjajaa@gmail.com>

pkgname=flameshot-imgur
_pkgname=flameshot
pkgver=13.1.0
pkgrel=1
pkgdesc="Powerful yet simple to use screenshot software with Imgur upload support enabled"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url="https://github.com/flameshot-org/flameshot"
license=('GPL-3.0-or-later')
depends=('qt6-base' 'qt6-svg' 'hicolor-icon-theme' 'kguiaddons')
makedepends=('qt6-tools' 'cmake' 'ninja')
optdepends=(
    'gnome-shell-extension-appindicator: for system tray icon if you are using Gnome'
    'grim: for wlroots wayland support'
    'xdg-desktop-portal: for wayland support, you will need the implementation for your wayland desktop environment'
    'qt6-imageformats: for additional export image formats (e.g. tiff, webp, and more)'
)
provides=('flameshot')
conflicts=('flameshot' 'flameshot-git' 'flameshot-imgur-git')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/flameshot-org/flameshot/archive/v${pkgver}.tar.gz")
sha256sums=('1d755a618bdcb3e739f691cea55ed2d432f93e521a504f95b74abed0c595f6f7')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    cmake -GNinja -B build -S . \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DUSE_WAYLAND_CLIPBOARD=1 \
        -DDISABLE_UPDATE_CHECKER=1 \
        -DENABLE_IMGUR=ON

    cmake --build build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    DESTDIR="${pkgdir}" cmake --install build
}