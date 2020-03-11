# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=qt5-gsettings
pkgver=1.3.0
pkgrel=1
pkgdesc="Qt-style wrapper for GSettings"
arch=('x86_64')
url="https://github.com/lirios/qtgsettings"
license=('LGPL3')
depends=('qt5-declarative' 'glib2')
makedepends=('liri-cmake-shared')
groups=('liri')
source=("https://github.com/lirios/qtgsettings/releases/download/v${pkgver}/qtgsettings-${pkgver}.tar.xz"
        qtgsettings-qt-5.14.patch::https://github.com/lirios/qtgsettings/commit/153d3a85cc797f225ab466ae7d4e9c48b8bbf1bd.patch)
sha512sums=('943c6f58ca6876f1ea0991a6159dfea862c9f3292f7c63d86c8528bb2831c2df94931e5290016abc0fdf17f4805b5b893bb55d8a679e1ca68703b5d997a072e9'
            '1331ef298efaa7d8269f4ad976aff1886603b1a634175b78de546605f312ccf8cce9f2eba0b111d2f4fb520ede01423f4a20ea44a51c3159017409b93dc629c9')

prepare() {
  patch -d qtgsettings-$pkgver -p1 -i ../qtgsettings-qt-5.14.patch
  mkdir -p build
}

build() {
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ../qtgsettings-$pkgver
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
