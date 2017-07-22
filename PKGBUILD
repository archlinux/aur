# Maintainer: Michael Yang <ohmyarchlinux@gmail.com>
# Maintainer: Adam Nielsen <malvineous@shikadi.net>

pkgname=xlnt-git
pkgver=0.9.5.r1024.9f9dfe7
pkgrel=1
pkgdesc="Cross-platform user-friendly xlsx library for C++14"
url="https://github.com/tfussell/xlnt"
arch=('i686' 'x86_64')
license=('MIT')
makedepends=('git' 'cmake>=3.2.0')
conflicts=('xlnt')
provides=('xlnt')
source=("git://github.com/tfussell/xlnt.git")
sha512sums=('SKIP')

pkgver() {
  cd xlnt
  echo "$(grep project source/CMakeLists.txt | cut -d '(' -f2 | cut -d ')' -f1 | cut -d ' ' -f3).r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../xlnt \
    -DTESTS=OFF \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
  install -Dm644 xlnt/LICENSE.md ${pkgdir}/usr/share/licenses/xlnt-git/LICENSE.md
}
