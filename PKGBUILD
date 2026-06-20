# Maintainer: WackyIdeas <wackyideas@disroot.org>

pkgname=('aeroshell-libplasma-git')
pkgver=6.7.0_18030.rd1c5ad5a1
pkgrel=1
pkgdesc="Plasma library and runtime components, with AeroShell patches"
arch=(x86_64)
url="https://gitgud.io/aeroshell/libplasma"
license=(LGPL-2.0-or-later)
depends=(gcc-libs
         glibc
         plasma-activities
         kcolorscheme
         kconfig
         kcoreaddons
         kglobalaccel
         kguiaddons
         ki18n
         kiconthemes
         kio
         kirigami
         knotifications
         kpackage
         ksvg
         kwidgetsaddons
         kwindowsystem
         libglvnd
         libx11
         libxcb
         qt6-5compat
         qt6-base
         qt6-declarative
         wayland)
makedepends=(git
             extra-cmake-modules
             kdoctools
             wayland-protocols
             plasma-wayland-protocols)
conflicts=(plasma-framework libplasma aeroshell-libplasma)
replaces=(plasma-framework)
provides=(libplasma aeroshell-libplasma)
options=('!debug')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%}"
  echo "$(grep 'set(PROJECT_VERSION ' CMakeLists.txt | cut -d '"' -f 2)_$(git rev-list --count HEAD).r$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%} \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

