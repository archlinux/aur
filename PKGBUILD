# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=plasma5-applets-simplemenu-git
_gitname=plasma-simplemenu
pkgver=1.0.4.r51.g6b3ad3e
pkgrel=1
pkgdesc="Simplified menu for your Plasma Desktop"
arch=('any')
url="https://invent.kde.org/plasma/plasma-simplemenu"
license=('GPL3')
depends=('plasma-workspace')
makedepends=('git' 'extra-cmake-modules')
provides=('plasma5-applets-simplemenu')
conflicts=('plasma5-applets-simplemenu')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${_gitname}
  ( set -o pipefail
    git describe --long --tags --first-parent --match 'v[0-9][0-9.][0-9.]*' | \
      sed 's=^v==;s=^\([0-9][0-9.]*\)-\([a-zA-Z]\+\)=\1\2=;s=\([0-9]\+-g\)=r\1=;s=-=.=g'
  )
}

build() {
  mkdir -p cd ${srcdir}/${_gitname}/build
  cd ${srcdir}/${_gitname}/build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
  cd ${srcdir}/${_gitname}/build
  make DESTDIR="$pkgdir" install
}
