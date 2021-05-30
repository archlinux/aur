# Merged with official ABS phonon PKGBUILD by João, 2021/05/01 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgbase=phonon-git
pkgname=(phonon-qt5-git)
pkgdesc="The multimedia framework by KDE"
pkgver=4.11.1_r3850.g6a5106d3
pkgrel=1
arch=($CARCH)
url='https://community.kde.org/Phonon'
license=(LGPL)
depends=(libpulse qt5-base)
optdepends=('pulseaudio: PulseAudio support' 'qt5-tools: Designer plugin')
makedepends=(git extra-cmake-modules-git qt5-tools)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
source=("git+https://github.com/KDE/${pkgbase%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgbase%-git}
  _ver="$(grep -m1 'project(Phonon VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgbase%-git} \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package_phonon-qt5-git(){
  depends+=(phonon-qt5-backend)

  DESTDIR="$pkgdir" cmake --install build
}
