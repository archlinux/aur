# Contributor: WackyIdeas <wackyideas@disroot.org>
# Maintainer: catpswin56 <catpswin5@proton.me>

pkgname=('win-gadgets-git')
pkgver=6.6.2_41.r612e6cc
pkgrel=1
pkgdesc="A recreation of the Windows Gadgets for AeroShell-based desktops"
arch=(x86_64)
url="https://gitgud.io/catpswin56/win-gadgets"
license=('AGPL-3.0-or-later')
depends=(glibc
         libstdc++
         kcoreaddons
         ki18n
         kirigami
         qt6-base
         qt6-declarative
         qt6-5compat
         kio
         kcmutils
         plasma5support
         libplasma
         ksvg
         kunitconversion
         kholidays
         plasma-workspace)
makedepends=(git
             extra-cmake-modules)
options=('!debug')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')
groups=(aerothemeplasma-extras
        vistathemeplasma-extras)

pkgver() {
  cd "$srcdir/${pkgname%}"
  echo "$(grep 'set(PROJECT_VERSION ' CMakeLists.txt | cut -d ' ' -f 2 | cut -d ')' -f 1)_$(git rev-list --count HEAD).r$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%} \
    -DBUILD_TESTING=OFF -DCMAKE_INSTALL_LIBEXECDIR=lib
  cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
