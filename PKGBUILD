# Maintainer: fn2006 <usernamefn2006alreadyused@protonmail.com>
# Contributor: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: txtsd <aur.archlinux@ihavea.quest>
# Contributor: Lenny McLennington <lennymclennington@protonmail.com>
# Contributor: Elijah Gregg <lovetocode999@tilde.team>
# Contributor: Miko <mikoxyzzz@gmail.com>
# Contributor: Cheru Berhanu <aur attt cheru doot dev>
# Contributor: dada513 <dada513@protonmail.com>

pkgname=pollymc
pkgver=7.2
pkgrel=2
pkgdesc="Prism Launcher fork that adds Ely.by support and allows you to use offline mode without an account."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/fn2006/PollyMC"
license=('GPL3')
depends=('java-runtime' 'libgl' 'qt6-base' 'qt6-5compat' 'qt6-svg' 'qt6-imageformats' 'zlib' 'hicolor-icon-theme' 'quazip-qt6' 'tomlplusplus' 'cmark')
conflicts=('prismlauncher')
makedepends=('cmake' 'extra-cmake-modules' 'git' 'java-environment' 'scdoc' 'ghc-filesystem' 'gamemode')
optdepends=('glfw: to use system GLFW libraries'
            'openal: to use system OpenAL libraries'
            'visualvm: Profiling support'
            'xorg-xrandr: for older minecraft versions')
source=("https://github.com/fn2006/PollyMC/releases/download/${pkgver}/PollyMC-${pkgver}.tar.gz"
        "https://aur.archlinux.org/cgit/aur.git/plain/0001-fix-Fix-building-prismlauncher-7.2-on-Qt-6.6.0.patch?h=prismlauncher")
sha256sums=('293042eead9d61f5a5be3277cd35d6048bee104099ca6ff5107712e3796631e1'
            '407162bb56d08c7f825632ce486bde8ab03dbceac0a0669ea751f475a1947306')

prepare() {
  cd "PollyMC-${pkgver}"
  patch -Np1 -i "${srcdir}/0001-fix-Fix-building-prismlauncher-7.2-on-Qt-6.6.0.patch?h=prismlauncher"
}

build() {
  cd "PollyMC-${pkgver}"

  cmake -DCMAKE_BUILD_TYPE= \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DLauncher_BUILD_PLATFORM="archlinux" \
    -DLauncher_QT_VERSION_MAJOR="6" \
    -Bbuild -S.
  cmake --build build
}

check() {
  cd "PollyMC-${pkgver}/build"
  ctest .
}

package() {
  cd "PollyMC-${pkgver}/build"
  DESTDIR="${pkgdir}" cmake --install .
}

