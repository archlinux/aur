# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=haruna-git
pkgver=0.6.0.r0.g8a52529
pkgrel=1
pkgdesc="A Qt/QML video player built on top of libmpv"
url="https://github.com/g-fb/haruna"
arch=('x86_64')
license=('GPL3')
depends=('breeze' 'kfilemetadata' 'kio-extras' 'mpv' 'qqc2-desktop-style' 'youtube-dl')
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
