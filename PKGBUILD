# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=haruna-git
pkgver=0.5.0.r73.g783c06b
pkgrel=1
pkgdesc="A Qt/QML video player built on top of libmpv"
url="https://github.com/g-fb/haruna"
arch=('x86_64')
license=('GPL3')
depends=('breeze-icons' 'kfilemetadata' 'kio' 'kxmlgui' 'mpv' 'kirigami2')
makedepends=('extra-cmake-modules' 'git')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//g'
}

build() {
  cmake -B build -S "${pkgname%-*}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
