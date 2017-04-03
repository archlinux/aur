# Maintainer: Guilhem Saurel <saurel@laas.fr>

_ros=ros-indigo
pkgname=hpp-model-urdf
pkgver=3.2
pkgrel=2
pkgdesc="Implements a library that allows you to load an hpp-model robot by parsing an urdf robot model file."
arch=('i686' 'x86_64')
url="https://github.com/humanoid-path-planner/$pkgname"
license=('LGPL3')
depends=('assimp' 'hpp-util-git' 'hpp-model' "$_ros-resource-retriever" "$_ros-urdf" "$_ros-urdfdom" "$_ros-srdfdom")
makedepends=('cmake' 'ros-build-tools' "$_ros-catkin")
source=("https://github.com/humanoid-path-planner/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('8aaf308502c350640b262e85d25c61c9')

build() {
    source /usr/share/ros-build-tools/clear-ros-env.sh
    source /opt/ros/indigo/setup.bash
    cd "$pkgname-$pkgver"
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib .
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
