# Maintainer: marco.rubin@protonmail.com

_name=KDDockWidgets
pkgname=kddockwidgets-qt6
pkgver=2.0.0
pkgrel=3
pkgdesc="KDAB's Dock Widget Framework for Qt 6"
arch=('x86_64')
url="https://github.com/KDAB/KDDockWidgets"
license=("GPL2" "custom:KDAB commercial license")
depends=('nlohmann-json' 'spdlog>=1.8.0' 'qt6-base>=6.2.0' 'qt6-declarative')
makedepends=('cmake>=3.15' 'qt6-tools>=6.6.2')
source=("$url/archive/v$pkgver.tar.gz")
b2sums=('af747d99ea105500348c5639ad5f7ca8e9efd07386cfc46f94aa3d16c3c15b428e1eca1a1047b65610a393b9a7a732a8bb18b3695aaf4093a5ba9b1e21fa87b6')

build() {
    cd $_name-$pkgver
    cmake -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DKDDockWidgets_FRONTENDS='qtwidgets;qtquick' \
          -DKDDockWidgets_QT6=true \
          .
    cmake --build .
}

package() {
    cd $_name-$pkgver
    DESTDIR="$pkgdir" cmake --install .
}
