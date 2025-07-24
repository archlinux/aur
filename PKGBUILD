# Maintainer: Hammer <topo20@protonmail.com>

pkgname=zdocscan-git
_pkgname=zdocscan
pkgver=0.0.4_r20498ec
pkgrel=1
pkgdesc="Process phone-taken photos to produce high quality scanned documents"
arch=('x86_64')
url="https://github.com/hammerfunctor/zdocscan"
license=('GPL-3.0-or-later')
depends=('glibc' 'djvulibre' 'potrace')
makedepends=('zig' 'git')
#_commit=75ff838984008e545b07f7c4d21cf25f1ff77137
#source=("${_pkgname}::git+https://github.com/hammerfunctor/texmacs#commit=$_commit")
#sha256sums=('19238e3d8d4b5894b8c9752b1f530a6be4a1d517000c85dc6c4efb4969e0b945')
source=("${_pkgname}::git+https://github.com/hammerfunctor/zdocscan")
sha256sums=('SKIP')
provides=('zdocscan')
conflicts=('zdocscan')
LANG=C

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "%s_r%s" \
         $(awk -F '\"' '/version/ {print $2}' build.zig.zon) \
         $(git rev-parse --short HEAD)
}

build() {
  cd "${srcdir}/${_pkgname}"

  /bin/zig build -Doptimize=ReleaseFast
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -D -m 0755 zig-out/bin/zdocscan "${pkgdir}"/usr/bin/zdocscan
}
