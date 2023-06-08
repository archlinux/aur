# Merged with official ABS phonon PKGBUILD by João, 2021/05/01 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgname=phonon-qt5-git
pkgdesc="The multimedia framework by KDE"
pkgver=4.11.1_r3911.g0f0ae8d0
pkgrel=1
arch=($CARCH)
url='https://community.kde.org/Phonon'
license=(LGPL)
depends=(libpulse qt5-base phonon-qt5-backend)
optdepends=('pulseaudio: PulseAudio support' 'qt5-tools: Designer plugin')
makedepends=(git extra-cmake-modules-git qt5-tools)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
source=("git+https://github.com/KDE/${pkgname%%-*}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%%-*}
  _ver="$(grep -m1 'project(Phonon VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%%-*} \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
