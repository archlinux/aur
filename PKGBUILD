pkgname=libvsr-git
pkgver=r234.e5ebef8
pkgrel=1
pkgdesc="versor - a c++ template library for euclidean, conformal and arbitrary geometric algebras"
arch=(any)
license=(bsd)
makedepends=(git cmake)
depends=(glew)
provides=(libvsr)
source=("git://github.com/wolftype/versor.git#branch=devel")
url="http://versor.mat.ucsb.edu/"
md5sums=(SKIP)

pkgver() {
  # from https://wiki.archlinux.org/index.php/VCS_package_guidelines#Git
  cd versor &&
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  # libvsr does not come with an installer.
  # to build without graphics (and not need glew dependency)
  #   ./build.sh --math
  target="$pkgdir/usr"
  cd versor &&
  git submodule init &&
  git submodule update &&
  ./build.sh &&
  mkdir -p "$target" &&
  cp -rt "$target" "$srcdir/versor/include" &&
  find "$target" -type d -exec chmod 0755 {} \; &&
  find "$target" -type f -exec chmod 0644 {} \;
}
