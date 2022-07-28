# Maintainer: Yellow <yellow@example.com>
# Maintainer: Lenny McLennington <lennymclennington@protonmail.com>
# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: Elijah Gregg <lovetocode999@tilde.team>
# Contributor: Miko <mikoxyzzz@gmail.com>
# Contributor: Cheru Berhanu <aur attt cheru doot dev>
# Contributor: dada513 <dada513@protonmail.com>

pkgname=polymc
pkgver=1.4.1
pkgrel=1
pkgdesc="Minecraft launcher with ability to manage multiple instances."
arch=('i686' 'x86_64')
url="https://github.com/PolyMC/PolyMC"
license=('GPL3')
depends=('java-runtime' 'libgl' 'qt6-base' 'qt6-5compat' 'qt6-svg' 'qt6-imageformats' 'zlib' 'hicolor-icon-theme' 'quazip-qt6')
makedepends=('cmake' 'extra-cmake-modules' 'git' 'java-environment' 'scdoc')
optdepends=('glfw: to use system GLFW libraries'
            'openal: to use system OpenAL libraries'
            'visualvm: Profiling support'
            'xorg-xrandr: for older minecraft versions'
)
source=("https://github.com/PolyMC/PolyMC/releases/download/$pkgver/PolyMC-$pkgver.tar.gz")
sha256sums=('c7f893e2f8641abcb3bd7fe2ffeda1c7d99ff7e8774c76f9b53f6629e83eab2f')

build() {

  cmake -DCMAKE_BUILD_TYPE= \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DLauncher_BUILD_PLATFORM="archlinux" \
    -DLauncher_QT_VERSION_MAJOR="6" \
    -Bbuild -SPolyMC-$pkgver
  cmake --build build
}

check() {
  cd "build"
  ctest .
}

package() {
  cd "build"
  DESTDIR="$pkgdir" cmake --install .
}
