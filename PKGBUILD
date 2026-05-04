# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=args-git
pkgver=6.4.15.r2.g0bedb27
pkgrel=1
pkgdesc="Simple header-only C++ argument parser library"
arch=(any)
url="https://github.com/Taywee/args"
license=(MIT)
makedepends=(cmake git)
provides=(args)
conflicts=(args)
source=("git+https://github.com/Taywee/args.git")
sha256sums=('SKIP')

pkgver() {
  cd args
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "args" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -D args/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
