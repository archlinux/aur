# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>
# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: Lenny McLennington <lennymclennington@protonmail.com>
# Contributor: Elijah Gregg <lovetocode999@tilde.team>
# Contributor: Miko <mikoxyzzz@gmail.com>
# Contributor: Cheru Berhanu <aur attt cheru doot dev>
# Contributor: dada513 <dada513@protonmail.com>

pkgname=prismlauncher
pkgver=6.1
pkgrel=1
pkgdesc="Minecraft launcher with ability to manage multiple instances."
arch=('i686' 'x86_64' 'aarch64')
url="https://prismlauncher.org"
license=('GPL3')
depends=('java-runtime' 'libgl' 'qt6-base' 'qt6-5compat' 'qt6-svg' 'qt6-imageformats' 'zlib' 'hicolor-icon-theme' 'quazip-qt6')
makedepends=('cmake' 'extra-cmake-modules' 'git' 'java-environment' 'scdoc' 'ghc-filesystem' 'gamemode' 'tomlplusplus')
optdepends=('glfw: to use system GLFW libraries'
            'openal: to use system OpenAL libraries'
            'visualvm: Profiling support'
            'xorg-xrandr: for older minecraft versions')
source=("https://github.com/PrismLauncher/PrismLauncher/releases/download/$pkgver/PrismLauncher-$pkgver.tar.gz")
sha256sums=('d89171a982af0f93208b25c33f5f890ca9674bd0573e685da969d6436103da9c')

build() {
  cd "PrismLauncher-$pkgver"

  cmake -DCMAKE_BUILD_TYPE= \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DLauncher_BUILD_PLATFORM="archlinux" \
    -DLauncher_QT_VERSION_MAJOR="6" \
    -Bbuild -S.
  cmake --build build
}

check() {
  cd "PrismLauncher-$pkgver/build"
  ctest .
}

package() {
  cd "PrismLauncher-$pkgver/build"
  DESTDIR="$pkgdir" cmake --install .
}
