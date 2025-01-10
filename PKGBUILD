# Maintainer: Tim Zhou <ttzhou@uwaterloo.ca>
# Author: ttz <ttzhou@uwaterloo.ca>

_pkgname=setroot
pkgname=setroot
pkgver=2.0.3.r0.g3c1227e
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
source=("git+https://github.com/ttzhou/${_pkgname}.git")
install='setroot.install'
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  echo $(git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g')
}

build() {
  cd $_pkgname
  make xinerama="$(pkg-config --exists xinerama && echo 1)"
}

package() {
  cd $_pkgname
  make PREFIX="/usr" DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
