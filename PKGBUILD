# Maintainer: Yellow <yellow@example.com>
# Maintainer: Lenny McLennington <lennymclennington@protonmail.com>
# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: Elijah Gregg <lovetocode999@tilde.team>
# Contributor: Miko <mikoxyzzz@gmail.com>
# Contributor: Cheru Berhanu <aur attt cheru doot dev>
# Contributor: dada513 <dada513@protonmail.com>

pkgname=polymc
pkgver=1.2.2
pkgrel=1
pkgdesc="Minecraft launcher with ability to manage multiple instances."
arch=('i686' 'x86_64')
url="https://github.com/PolyMC/PolyMC"
license=('GPL3')
depends=('java-runtime' 'libgl' 'qt5-base' 'zlib' 'qt5-imageformats' 'qt5-svg' 'hicolor-icon-theme' 'quazip-qt5')
conflicts=('polymc')
makedepends=('cmake' 'git' 'java-environment')
optdepends=('glfw: to use system GLFW libraries'
            'openal: to use system OpenAL libraries'
            'visualvm: Profiling support'
            'xorg-xrandr: for older minecraft versions'
)
source=("https://github.com/PolyMC/PolyMC/releases/download/$pkgver/PolyMC-$pkgver.tar.gz")

sha256sums=('4ce46406040b5315a598e412feecb70e5248cfc07fac9e3086597af12c102137')

build() {
  cd "${srcdir}/PolyMC-$pkgver"
  mkdir -p build

  cd build
  cmake -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DLauncher_BUILD_PLATFORM="archlinux" \
    -DLauncher_APP_BINARY_NAME="${pkgname}" \
    -Wno-dev \
    ..
  cmake --build .
}

check() {
  cd "${srcdir}/PolyMC-$pkgver/build"
  ctest .
}

package() {
  cd "${srcdir}/PolyMC-$pkgver/build"
  DESTDIR="$pkgdir" cmake --install .
}
