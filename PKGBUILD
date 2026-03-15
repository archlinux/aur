# Maintainer: WackyIdeas <wackyideas@disroot.org>

pkgname=('aeroshell-workspace-git')
pkgver=6.6.1_13.rc5f8339
pkgrel=1
pkgdesc="Various components required by AeroShell-based desktops"
arch=(x86_64)
url="https://gitgud.io/aeroshell/aeroshell-workspace"
license=('AGPL-3.0-or-later')
depends=(gcc-libs
         glibc
         kconfig
         kcmutils
         aeroshell-libplasma
         sddm
         libksysguard
         plasma-workspace
         qt6-declarative
         kjobwidgets
         plasma-activities-stats
         ki18n
         kcoreaddons
         kwindowsystem
         kservice
         kio
         qt6-base)
makedepends=(git
             extra-cmake-modules)
options=('!debug')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')
conflicts=(aeroshell-workspace)
provides=(aeroshell-workspace)

pkgver() {
  cd "$srcdir/${pkgname%}"
  echo "$(grep 'set(PROJECT_VERSION ' CMakeLists.txt | cut -d '"' -f 2)_$(git rev-list --count HEAD).r$(git rev-parse --short HEAD)"
}

build() {
  DESTDIR="$pkgdir" cmake -B build -S ${pkgname%} \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
