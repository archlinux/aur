# Maintainer: Murray Groves <aur at murraygrov dot es>

pkgname=behaviortree-cpp-git
pkgver=4.8.4.r64.gfee8964
pkgrel=1
pkgdesc="Behavior Trees Library in C++. Batteries included."
url="https://github.com/BehaviorTree/BehaviorTree.CPP"
arch=('any')
depends=(
)
makedepends=('conan')
source=("$pkgname::git+https://github.com/BehaviorTree/BehaviorTree.CPP.git#branch=master")

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    conan profile detect -e
}

build() {
    cd $pkgname
    conan install . -s build_type=Release --build=missing
    cmake --preset conan-release
    cmake --build --preset conan-release
}

package() {
    cd $pkgname
    DESTDIR="$pkgdir" cmake --install build/Release --config Release
}

sha256sums=('SKIP')
