# Maintainer: Sencyy <sencyy@protonmail.com>
# Most of this PKGBUILD was taken from prismlauncher

pkgname=prismlauncher-cracked
pkgver=8.4.1
pkgrel=2
pkgdesc="Minecraft launcher with ability to manage multiple instances and support for offline accounts."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/Diegiwg/PrismLauncher-Cracked"
license=('GPL-3.0-only AND LGPL-3.0-or-later AND LGPL-2.0-or-later AND Apache-2.0 AND MIT AND BSD-2-Clause AND BSD-3-Clause AND LicenseRef-Batch AND OFL-1.1')
conflicts=('prismlauncher' 'prismlauncher-git')
provides=('prismlauncher')
depends=('java-runtime=17' 'libgl' 'qt6-base' 'qt6-5compat' 'qt6-svg' 'qt6-imageformats' 'qt6-networkauth' 'zlib' 'hicolor-icon-theme' 'quazip-qt6' 'tomlplusplus' 'cmark')
makedepends=('cmake' 'extra-cmake-modules' 'git' 'jdk17-openjdk' 'scdoc' 'ghc-filesystem' 'gamemode')
optdepends=('glfw: to use system GLFW libraries'
  'openal: to use system OpenAL libraries'
  'visualvm: Profiling support'
  'xorg-xrandr: for older minecraft versions'
  'java-runtime=8: for older minecraft versions'
  'flite: minecraft voice narration')
source=("https://github.com/Diegiwg/PrismLauncher-Cracked/releases/download/v${pkgver}/PrismLauncher-v${pkgver}.tar.gz")
sha256sums=('2375dcf38e22f612b9b9c8d8325fe4b52b7ba8daf15089f83b0aaec6dadc2f0c')

prepare() {
  cd "PrismLauncher-v${pkgver}"

}

build() {
  cd "PrismLauncher-v${pkgver}"

  export PATH="/usr/lib/jvm/java-17-openjdk/bin:$PATH"

  cmake -DCMAKE_BUILD_TYPE= \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DLauncher_BUILD_PLATFORM="archlinux" \
    -DLauncher_QT_VERSION_MAJOR="6" \
    -Bbuild -S.
  cmake --build build
}

check() {
  cd "PrismLauncher-v${pkgver}/build"
  ctest .
}

package() {
  cd "PrismLauncher-v${pkgver}/build"
  DESTDIR="${pkgdir}" cmake --install .
}
