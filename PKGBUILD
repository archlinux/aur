# Maintainer: xiota / aur.chaotic.cx
# Contributor: 2xsaiko <aur@dblsaiko.net>

_gitname="kde-rounded-corners"
_pkgname="kwin-effect-rounded-corners"
pkgname="$_pkgname-git"
pkgver=0.4.2.r3.ge784166
pkgrel=1
pkgdesc="Rounds the corners of your windows"
arch=('x86_64')
url="https://github.com/matinlotfali/KDE-Rounded-Corners"
license=("GPL3")

provides=(
  "$_gitname"
  "$_pkgname"
)
conflicts=(
  "$_gitname"
  "$_pkgname"
)

depends=(
  'kwin'
)
makedepends=(
  'cmake'
  'extra-cmake-modules'
  'git'
  'kdelibs4support'
  'kinit'
  'qt5-tools'
)

source=(
  "$_gitname"::"git+$url"
)
sha256sums=(
  "SKIP"
)

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  local _cmake_options=(
    -B build
    -S "$_gitname"
    -DCMAKE_BUILD_TYPE="Release"
    -DCMAKE_INSTALL_PREFIX='/usr'
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
