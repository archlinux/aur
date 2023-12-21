# Maintainer: Lenny McLennington <lennymclennington@protonmail.com>
# Contributor: Yellow <yellow@example.com>
# Contributor: Elijah Gregg <lovetocode999@tilde.team>
# Contributor: Miko <mikoxyzzz@gmail.com>
# Contributor: Cheru Berhanu <aur attt cheru doot dev>
# Contributor: dada513 <dada513@protonmail.com>

pkgname=polymc-qt5
pkgver=6.0
pkgrel=1
pkgdesc="Minecraft launcher with the ability to manage multiple instances."
arch=('i686' 'x86_64')
url="https://github.com/PolyMC/PolyMC"
license=('GPL3')
depends=('java-runtime' 'libgl' 'qt5-base' 'qt5-svg' 'qt5-imageformats' 'zlib' 'hicolor-icon-theme' 'quazip-qt5' 'qt5-charts')
provides=('polymc')
conflicts=('polymc')
makedepends=('cmake' 'extra-cmake-modules' 'git' 'java-environment' 'scdoc')
optdepends=('glfw: to use system GLFW libraries'
            'openal: to use system OpenAL libraries'
            'visualvm: Profiling support'
            'xorg-xrandr: for older minecraft versions'
)
source=("https://github.com/PolyMC/PolyMC/releases/download/$pkgver/PolyMC-$pkgver.tar.gz")

sha256sums=('ed8a43555c9fcfa783193a0377c6353bb5c9360a0e5742bbb6be4f7c6e7b2704')

build() {

  cmake -DCMAKE_BUILD_TYPE= \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DLauncher_QT_VERSION_MAJOR=5 \
    -Bbuild -SPolyMC-$pkgver
  cmake --build build
}

package() {
  cd "build"
  DESTDIR="$pkgdir" cmake --install .
}
