# Maintainer:Alexandr Parkhomenko <it@52tour.ru>

# Christian Stewart
_author=paralin
_pkgname=soil
pkgname=${_pkgname}-git
pkgver=1.16
pkgrel=1
pkgdesc='SOIL is a tiny C library used primarily for uploading textures into OpenGL. It is based on stb_image version 1.16'
arch=(
  'x86_64'
)

url='https://github.com/'
license=('MIT')
depends=()
makedepends=('git' 'cmake')
source=("git://github.com/$_author/$_pkgname"
        "CMake.patch::https://aur.archlinux.org/cgit/aur.git/plain/CMake.patch?h=$pkgname"
       )
sha256sums=('SKIP' 'SKIP')
provide=('soil')
conflicts=('soil')

prepare() {
  cd "$srcdir/$_pkgname"
  patch --forward --strip=1 --input="$startdir/CMake.patch"
}

#pkgver () {
#  cd "$srcdir/$_pkgname"
#  git describe --tags --long | sed -r 's/^v//;s/-RC/RC/;s/([^-]*-g)/r\1/;s/-/./g'
#}

build() {
  cd "$startdir"
  if [ ! -d "build/$_pkgname" ]; then
    mkdir -p "build/$_pkgname";
  fi
  cd "build/$_pkgname"
  cmake "$srcdir/$_pkgname"
  make
}

check() {
  cd "$startdir/build/$_pkgname"
#  make test
}

package() {
  cd "$startdir/build/$_pkgname"
  DESTDIR="$pkgdir" make install
}
