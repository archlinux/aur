# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=minizinc-ide-git
pkgver=2.10.0.r6.g29bf75d
pkgrel=1
pkgdesc="Integrated development environment for the high-level constraint modelling language MiniZinc"
arch=(x86_64)
url="https://github.com/MiniZinc/MiniZincIDE"
license=(MPL-2.0)
depends=(
    glibc
    libgcc
    libstdc++
    qt6-base
    qt6-websockets
    )
makedepends=(git)
provides=(minizinc-ide)
conflicts=(minizinc-ide)
source=("git+https://github.com/MiniZinc/MiniZincIDE.git")
sha256sums=('SKIP')

pkgver() {
  cd MiniZincIDE
  git describe --long --tags --abbrev=7 --exclude edge* | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

  # Disable all warnings
  export CFLAGS+=" -w"
  export CXXFLAGS+=" -w"

build() {
  cd MiniZincIDE
  qmake6
  make
}

package() {
  cd MiniZincIDE
  make install INSTALL_ROOT="${pkgdir}/usr"
}
