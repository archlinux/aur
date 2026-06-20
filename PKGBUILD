# Maintainer: WackyIdeas <wackyideas@disroot.org>

pkgname=('aerothemeplasma-desktop-x11-git')
pkgver=6.7.0_724.r5fd2458
pkgrel=1
pkgdesc="X11 session for AeroThemePlasma"
arch=(any)
url="https://github.com/aeroshell-desktop/aerothemeplasma"
license=('AGPL-3.0-or-later')
depends=(aerothemeplasma-desktop
         aeroshell-kwin-components-x11
         aeroshell-smodglow-x11
         aeroshell-libplasma
         aeroshell-workspace)
makedepends=(git
             extra-cmake-modules)
options=('!debug')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')
conflicts=(aerothemeplasma-desktop-x11)
provides=(aerothemeplasma-desktop-x11)
groups=(aerothemeplasma)

pkgver() {
  cd "$srcdir/${pkgname%}"
  echo "$(grep 'set(PROJECT_VERSION ' CMakeLists.txt | cut -d '"' -f 2)_$(git rev-list --count HEAD).r$(git rev-parse --short HEAD)"
}

build() {
  DESTDIR="$pkgdir" cmake -B build -S ${pkgname%} \
    -DBUILD_TESTING=OFF -DCMAKE_INSTALL_LIBEXECDIR=lib -DINSTALL_X11_COMPONENTS=ON
  cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}

