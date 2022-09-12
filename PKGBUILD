# Maintainer: Marco von Rosenberg <codingmarco@gmail.com>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: FadeMind <fademind@gmail.com>
# Contributor: Frikilinux <frikilinux at gmail.com>
# Contributor: Artem Sereda <overmind88@gmail.com>

pkgname=kde-thumbnailer-hpgl-git
pkgver=v1.0.0.r3.gfc38f4d
pkgrel=1
pkgdesc='KDE / Dolphin thumbnails for HPGL (HP graphics language) files (git)'
arch=(i686 x86_64)
url=https://github.com/CodingMarco/kde-thumbnailer-hpgl
license=(GPL)
depends=(hp2xx kio)
makedepends=(git cmake extra-cmake-modules)
source=(git+https://github.com/CodingMarco/kde-thumbnailer-hpgl.git)
md5sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  mkdir -p "${pkgname%-git}/build"
  cd "${pkgname%-git}/build"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib ..
  make
}

package() {
  cd "${pkgname%-git}/build"
  make DESTDIR="$pkgdir" install
}
