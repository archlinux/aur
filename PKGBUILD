# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
pkgname=cxxopts
#for fragment you can use one of: #commit=, #tag=, #branch=
#fragment=
pkgver=2.1.1.r23.g3876c09
pkgrel=1
pkgdesc="Lightweight C++ command line option parser"
arch=(any)
url="https://github.com/jarro2783/cxxopts"
license=(MIT)
makedepends=(git cmake)
source=(${pkgname}::git+https://github.com/jarro2783/cxxopts.git${fragment})
md5sums=(SKIP) #generate with 'makepkg -g'

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${pkgname}
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd ${pkgname}/build
  make DESTDIR="$pkgdir/" install
  install -D -m644 "../LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
