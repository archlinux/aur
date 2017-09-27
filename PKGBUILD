# Maintainer: bartus  <aur@bartus.33mail.com>
pkgname=nlohmann-json
#for fragment you can use one of: #commit=, #tag=, #branch=
#fragment=
pkgver=2.1.1.r487.gb05ea3de
pkgrel=1
pkgdesc="JSON for Modern C++, whole code consistes of a single header file"
arch=(any)
url="https://github.com/nlohmann/json"
license=(MIT)
makedepends=(git cmake)
source=(${pkgname}::git+https://github.com/nlohmann/json.git${fragment})
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

check() {
  cd ${pkgname}/build 
  make test
}

package() {
  cd ${pkgname}/build
  make DESTDIR="$pkgdir/" install
  install -D -m644 "../LICENSE.MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
