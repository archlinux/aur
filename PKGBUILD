# Contributor: 2xsaiko <aur@dblsaiko.net>

_gitname="kde-rounded-corners"
_pkgname="kwin-effect-rounded-corners"
pkgname="$_pkgname-git"
pkgver=0.3.0.r6.g28855e8
pkgrel=1
pkgdesc="Rounds the corners of your windows"
arch=('x86_64')
url="https://github.com/matinlotfali/KDE-Rounded-Corners"
license=("GPL3")
provides=(
  "$_gitname"{,-git}
  "$_pkgname"
  "kwin-effect-shapecorners"{,-git}
)
conflicts=(${provides[@]})
replaces=(
  "$_gitname"{,-git}
  "kwin-effect-shapecorners"{,-git}
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
sha512sums=(
  "SKIP"
)

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p qt5build
  cmake "../$_gitname" \
    -DCMAKE_INSTALL_PREFIX='/usr'
}

build() {
  cd qt5build
  make
}

package() {
  cd qt5build
  make DESTDIR="$pkgdir" install
}
