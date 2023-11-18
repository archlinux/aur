# Maintainer: fn2006 <usernamefn2006alreadyused@protonmail.com>
# Contributor: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: txtsd <aur.archlinux@ihavea.quest>
# Contributor: Lenny McLennington <lennymclennington@protonmail.com>
# Contributor: Elijah Gregg <lovetocode999@tilde.team>
# Contributor: Miko <mikoxyzzz@gmail.com>
# Contributor: Cheru Berhanu <aur attt cheru doot dev>
# Contributor: dada513 <dada513@protonmail.com>

pkgname=pollymc-qt5
pkgver=8.0
pkgrel=1
pkgdesc="DRM-free Prism Launcher fork with support for custom auth servers."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/fn2006/PollyMC"
license=('GPL3')
depends=('java-runtime' 'libgl' 'qt5-base' 'qt5-svg' 'qt5-imageformats' 'zlib' 'hicolor-icon-theme' 'quazip-qt5' 'tomlplusplus' 'cmark')
provides=('pollymc')
conflicts=('pollymc' 'prismlauncher')
makedepends=('cmake' 'extra-cmake-modules' 'git' 'java-environment' 'scdoc' 'ghc-filesystem' 'gamemode')
optdepends=('glfw: to use system GLFW libraries'
            'openal: to use system OpenAL libraries'
            'visualvm: Profiling support'
            'xorg-xrandr: for older minecraft versions')
source=("https://github.com/fn2006/PollyMC/releases/download/$pkgver/PollyMC-$pkgver.tar.gz")
sha256sums=('78d1c4bdda34b9336b82f5fed65a46a5e6e3721ae144ad6cbe812ce6534f3d14')

build() {
  cd "PollyMC-$pkgver"

  cmake -DCMAKE_BUILD_TYPE= \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DLauncher_BUILD_PLATFORM="archlinux" \
    -DLauncher_QT_VERSION_MAJOR="5" \
    -Bbuild -S.
  cmake --build build
}

package() {
  cd "PollyMC-$pkgver/build"
  DESTDIR="$pkgdir" cmake --install .
}

