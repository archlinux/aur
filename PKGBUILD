# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

_pkgname=lightly
pkgname=${_pkgname}-git
pkgver=r2022.fe1663e1
pkgrel=1
pkgdesc="A modern style for qt applications, forked from Breeze"
arch=(x86_64)
url="https://github.com/Luwx/Lightly"
license=("GPL2")
depends=("frameworkintegration" "kdecoration" "breeze-icons" "kwayland" "hicolor-icon-theme")
makedepends=("git" "extra-cmake-modules" "kcmutils") 
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/Luwx/Lightly.git")
sha512sums=('SKIP')


pkgver() {
    cd "$srcdir/${_pkgname}"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S "${_pkgname}" \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
