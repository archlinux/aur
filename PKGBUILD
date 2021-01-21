# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
_name=cxxopts
#for fragment you can use one of: #commit=, #tag=, #branch=
#_fragment="#tag=v2.1.2"
pkgname=${_name}-git
pkgver=2.2.0.r40.ged85f04
pkgrel=1
pkgdesc="Lightweight C++ command line option parser"
arch=(any)
url="https://github.com/jarro2783/cxxopts"
license=(MIT)
makedepends=(git cmake ninja)
source=(${pkgname}::git+https://github.com/jarro2783/cxxopts.git${_fragment})
md5sums=(SKIP) #generate with 'makepkg -g'

pkgver() {
  git -C "$srcdir/$pkgname" describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  CXXFLAGS+=" -Wno-error=pragmas"
  cmake \
  -S "$pkgname" \
  -B build \
  -G Ninja \
  -DCMAKE_INSTALL_PREFIX=/usr
  ninja -C build ${MAKEFLAGS:--j1}
}

package() {
  DESTDIR="$pkgdir/" ninja -C build install
  install -D -m644 "$pkgname"/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
