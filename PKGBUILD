# Maintainer: Kaydax <contact+aur@kaydax.xyz>
# Contributor: Yellow <yellow@example.com>
# Contributor: Lenny McLennington <lennymclennington@protonmail.com>
# Contributor: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: Elijah Gregg <lovetocode999@tilde.team>
# Contributor: Miko <mikoxyzzz@gmail.com>
# Contributor: Cheru Berhanu <aur attt cheru doot dev>
# Contributor: dada513 <dada513@protonmail.com>

pkgname=polymc
pkgver=6.0
pkgrel=1
pkgdesc="Minecraft launcher with the ability to manage multiple instances"
arch=('x86_64')
url="https://github.com/PolyMC/PolyMC"
license=('GPL3')
depends=('java-runtime' 'libgl' 'qt6-base' 'qt6-5compat' 'qt6-svg'
         'qt6-imageformats' 'zlib' 'hicolor-icon-theme' 'quazip-qt6' 'qt6-charts')
makedepends=('cmake' 'extra-cmake-modules' 'java-environment' 'scdoc')
optdepends=('glfw: to use system GLFW libraries'
            'openal: to use system OpenAL libraries'
            'visualvm: Profiling support'
            'xorg-xrandr: for older minecraft versions'
)
source=("https://github.com/PolyMC/PolyMC/releases/download/$pkgver/PolyMC-$pkgver.tar.gz")
sha256sums=('ed8a43555c9fcfa783193a0377c6353bb5c9360a0e5742bbb6be4f7c6e7b2704')

build() {
  cmake -B build -S PolyMC-$pkgver \
      -DLauncher_BUILD_PLATFORM='archlinux' \
      -DLauncher_QT_VERSION_MAJOR='6' \
      -DCMAKE_BUILD_TYPE='None' \
      -DCMAKE_INSTALL_PREFIX='/usr' \
      -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
