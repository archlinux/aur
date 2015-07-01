# Maintainer: Tim Zhou <ttzhou@uwaterloo.ca>
# Author: ttz <ttzhou@uwaterloo.ca>

_pkgname=setroot
pkgname=setroot
pkgver=v1.4.4
pkgrel=1
pkgdesc="simple program that sets your (X11) wallpaper. inspired by the *setroots and feh."
arch=('i686' 'x86_64')
url="https://github.com/ttzhou/setroot"
license=('GPLv3')
depends=('imlib2' 'libx11')
makedepends=('git' 'pkg-config')
optdepends=('sxiv: use its image viewer along with key-handler to call setroot'
            'libxinerama: for multiple monitors')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/ttzhou/${_pkgname}.git#tag=${pkgver}")
install=setroot.install
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  echo $(git describe)
}

build() {
  cd $_pkgname
  make xinerama=$(pkg-config --exists xinerama && echo 1)
}

package() {
  cd $_pkgname
  make PREFIX="usr" DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
