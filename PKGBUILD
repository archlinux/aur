# Contributor: Famiu Haque <famiuhaque@gmail.com>

pkgname=docopt.cpp-static-git
pkgver=0.6.3.r5.g400e6dd
pkgrel=1
pkgdesc="C++11 port of docopt (static libraries)"
arch=('x86_64')
url="https://github.com/docopt/docopt.cpp"
license=('MIT' 'BSL-1.0')
makedepends=('git' 'cmake')
conflicts=('docopt' 'docopt.cpp')
provides=('docopt.cpp')
source=("git+${url}.git")
options=('staticlibs')
sha512sums=('SKIP')

pkgver() {
  cd docopt.cpp
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./g'
}

build() {
  cmake -B build -S docopt.cpp \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
  make -C build
}

package() {
  make -C build DESTDIR="${pkgdir}" install
  cd docopt.cpp
  install -Dm644 LICENSE-MIT -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
