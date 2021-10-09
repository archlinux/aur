# Maintainer: Mohammad Mostafa Farzan <m2_farzan@yahoo.com>

pkgname=ros2-galactic-xacro
pkgver=r495.b8716fc
pkgrel=1
pkgdesc="A tool to construct shorter and more readable XML files by using macros that expand to larger XML expressions"
url="https://index.ros.org/p/xacro/"
arch=('any')
depends=('ros2-galactic'
         'python-yaml'
)
source=("xacro::git+https://github.com/ros/xacro#branch=ros2")
sha256sums=('SKIP')

pkgver() {
  cd $srcdir/xacro
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    source /opt/ros2/galactic/setup.sh
    colcon build --merge-install
}

package() {
    # Copy build files
    mkdir -p $pkgdir/opt/ros2/galactic
    cp -r $srcdir/install/* $pkgdir/opt/ros2/galactic/
    # Exclude files that clash with base ros installation
    rm $pkgdir/opt/ros2/galactic/*setup.*
    rm $pkgdir/opt/ros2/galactic/_local_setup*
    rm $pkgdir/opt/ros2/galactic/COLCON_IGNORE
}
