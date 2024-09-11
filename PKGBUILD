# Maintainer: Evan Goode <mail@evangoo.de>
# Contributor: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: txtsd <aur.archlinux@ihavea.quest>
# Contributor: seth <getchoo at tuta dot io>
# Contributor: fn2006 <usernamefn2006alreadyused@protonmail.com>
# Contributor: Lenny McLennington <lennymclennington@protonmail.com>
# Contributor: Elijah Gregg <lovetocode999@tilde.team>
# Contributor: Miko <mikoxyzzz@gmail.com>
# Contributor: Cheru Berhanu <aur attt cheru doot dev>
# Contributor: dada513 <dada513@protonmail.com>

pkgname=fjordlauncher-unlocked
pkgver=8.4.2
pkgrel=1
pkgdesc="Prism Launcher fork with support for alternative auth servers"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/hero-persson/FjordLauncherUnlocked"
license=('GPL-3.0-only AND LGPL-3.0-or-later AND LGPL-2.0-or-later AND Apache-2.0 AND MIT AND BSD-2-Clause AND BSD-3-Clause AND LicenseRef-Batch AND OFL-1.1')
depends=('java-runtime=17' 'libgl' 'qt6-base' 'qt6-5compat' 'qt6-svg' 'qt6-imageformats' 'zlib' 'hicolor-icon-theme' 'quazip-qt6' 'tomlplusplus' 'cmark')
makedepends=('cmake' 'extra-cmake-modules' 'git' 'jdk17-openjdk' 'scdoc' 'ghc-filesystem' 'gamemode')
optdepends=('glfw: to use system GLFW libraries'
            'openal: to use system OpenAL libraries'
            'visualvm: Profiling support'
            'xorg-xrandr: for older minecraft versions'
            'java-runtime=8: for older minecraft versions'
            'flite: minecraft voice narration')
source=("${url}/releases/download/${pkgver}/FjordLauncher-${pkgver}.tar.gz")
sha256sums=('b1e3c943f0b8f7f0fa5f50968d8a91c93e09416b12a2f433556c247e27da1f7b')

prepare() {
  cd "FjordLauncher-${pkgver}"

}

build() {
  cd "FjordLauncher-${pkgver}"

  export PATH="/usr/lib/jvm/java-17-openjdk/bin:$PATH"

  cmake -DCMAKE_BUILD_TYPE= \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DLauncher_BUILD_PLATFORM="archlinux" \
    -DLauncher_QT_VERSION_MAJOR="6" \
    -Bbuild -S.
  cmake --build build
}

check() {
  cd "FjordLauncher-${pkgver}/build"
  ctest .
}

package() {
  cd "FjordLauncher-${pkgver}/build"
  DESTDIR="${pkgdir}" cmake --install .
  mv "${pkgdir}/usr/share/mime/packages/modrinth-mrpack-mime.xml" \
     "${pkgdir}/usr/share/mime/packages/fjordlauncher-modrinth-mrpack-mime.xml"
}
