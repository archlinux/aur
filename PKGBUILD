# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=argh-git
pkgver=1.3.2.r9.gc3f0d8c
pkgrel=2
pkgdesc="Minimalist argument handler"
arch=(any)
url="https://github.com/adishavit/argh"
license=(BSD-3-Clause)
makedepends=(git cmake)
provides=(argh)
conflicts=(argh)
source=("git+https://github.com/adishavit/argh.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  [[ -d build ]] || mkdir build
}

build() {
  cd "${pkgname%-git}/build"
  cmake .. \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
  cd "${pkgname%-git}/build"
  make DESTDIR="${pkgdir}" install
  install -D ../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
