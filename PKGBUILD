_pkgname=pcl_conversions
_metaname=perception_pcl
_distro=humble
pkgname="ros2-$_distro-${_pkgname/_/-}"
pkgver=2.4.1
pkgrel=1
pkgdesc="Provides conversions from PCL data types and ROS message types."
url="https://index.ros.org/p/$_pkgname/"
license=("BSD")
arch=('any')
depends=(
    "ros2-$_distro" 
    "ros2-$_distro-pcl-msgs"
    'pcl'
    'openmpi'
    'nlohmann-json'
    'eigen'
)
source=("https://github.com/ros-perception/$_metaname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('cb1b36f65aeeacbbdeca0baf13907f38cadaf272bee46cf6775f0b3974d4cb0d')

build() {
    source /opt/ros/$_distro/setup.bash

    cmake -B build -S $_metaname-$pkgver/$_pkgname \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/$_distro \
        -Wno-dev
    
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
