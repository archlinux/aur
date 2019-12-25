# Maintainer: Igor Kushnir <igorkuo at gmail dot com>
pkgname=venturous
pkgver=1.4
pkgrel=1
pkgdesc="Random playback manager for Audacious"
arch=('i686' 'x86_64')
url="https://github.com/vedgy/venturous"
license=('GPL3')
depends=('qt5-base' 'libxkbcommon-x11' 'audacious')
makedepends=('git' 'cmake')
optdepends=('libnotify: desktop notifications'
            'libcue: Audacious CUE playlist format support'
            'xdg-utils: for some default custom actions')
_gitname="venturous"
_builddir="build"

prepare() {
  git clone "$url.git"
  cd "${_gitname}"
  # If you want to install latest development version (can be unstable), just
  # comment out the next line (# git checkout "tags/v$pkgver").
  git checkout "tags/v$pkgver"
}

build() {
  cd "$srcdir/${_gitname}"
  # If you prefer building with qt4, replace 'qt5-base' 'libxkbcommon-x11'
  # dependencies with 'qt4' and replace "qt5" with "qt4" on the next line:
  # ./update_submodules_and_configure qt4
  ./update_submodules_and_configure qt5
  cd "${_builddir}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "$srcdir/${_gitname}/${_builddir}"
  make DESTDIR="$pkgdir/" install
}
