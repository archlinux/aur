# Maintainer: Antonis G. <capoiosct at gmail dot com>

pkgname=kgocode-git
_gitpkgname=kgocode
pkgver=r7.e20403e
pkgrel=1
pkgdesc="Plugin for KTextEditor that provides basic code completion for the Go programming language."
arch=('i686' 'x86_64')
url="https://github.com/nkovacs/$_gitpkgname"
license=('GPL')
depends=('ktexteditor' 'kio' 'ki18n' 'kxmlgui' 'gocode-git')
makedepends=('git' 'extra-cmake-modules')
conflicts=('kgocode')
provides=('kgocode')
source=("git+https://github.com/nkovacs/$_gitpkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "${_gitpkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_gitpkgname}"

  mkdir -p build
  cd build
  rm -rf *

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
}

package() {
  cd "${_gitpkgname}"/build

  make install DESTDIR="${pkgdir}"
}

