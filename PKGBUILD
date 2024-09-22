# Maintainer: mertemba <max.mail@dameweb.de>

_pkgname="kwin-effect-luminvert"
pkgname="$_pkgname-git"
pkgver=0.1.0.r0.gef185ef
pkgrel=1
pkgdesc="KWin Desktop Effect to invert the luminance of window contents while preserving colors"
url="https://github.com/mertemba/kwin-effect-luminvert"
license=("GPL-3.0-only")
arch=('x86_64')

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

depends=(
  'kwin'
  'qt6-base'
  'kcoreaddons'
  'kglobalaccel'
  'kxmlgui'
  'kcmutils'
  'gcc-libs'
  'ki18n'
  'glibc'
)
makedepends=(
  'cmake'
  'extra-cmake-modules'
  'git'
  'ninja'
)

_pkgsrc="kwin-effect-luminvert"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=("SKIP")

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --always --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cmake -B build \
    -S "$_pkgsrc" \
    -G Ninja \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
