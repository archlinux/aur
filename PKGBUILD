# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=peruse-git
pkgver=1.0.r3.g50191c1
pkgrel=1
pkgdesc="A comic book viewer based on Frameworks 5, for use on multiple form factors."
url="http://peruse.kde.org/"
arch=('i686' 'x86_64')
license=('LGPL2.1')
depends=('baloo' 'kdeclarative' 'kirigami-git')
makedepends=('extra-cmake-modules' 'git')
optdepends=('okular-frameworks-git: for cbr, cb*, pdf, deja-vu, epub file support')
provides=('peruse')
conflicts=('peruse')
source=("git://anongit.kde.org/peruse.git")
md5sums=("SKIP")

pkgver() {
  cd peruse
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p build
  cd peruse
  git submodule init
  git submodule update
}

build() {
  cd build
  cmake ../peruse \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib
  make
}

package() {
  make -C build DESTDIR=$pkgdir install
}
