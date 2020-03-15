# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=haruna-git
pkgver=0.1.1.r5.gd03700e
pkgrel=1
pkgdesc="A Qt/QML video player built on top of libmpv"
url="https://github.com/g-fb/haruna"
arch=('x86_64')
license=('GPL3')
depends=('kfilemetadata' 'kxmlgui' 'mpv' 'qt5-quickcontrols' 'qt5-quickcontrols2')
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
  cd "${pkgname%-*}"
  cmake . \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "${pkgname%-*}"
  make DESTDIR="${pkgdir}" install
}
