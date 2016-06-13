# Maintainer: Yen Chi Hsuan <yan12125 at gmail.com>
# Contributor: Yushin Huang <hyslion AT gmail.com>

_pkgname=libchewing
pkgname=libchewing-git
pkgver=0.5.1.r8.g583bc02
pkgrel=1
epoch=1
pkgdesc='Intelligent Chinese phonetic input method'
url='http://chewing.im/'
arch=('i686' 'x86_64')
license=('GPL')
conflicts=('libchewing')
provides=('libchewing')
depends=('sqlite')
makedepends=('git')
source=("git+https://github.com/chewing/libchewing/")
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long --tag 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${_pkgname}"
  ./autogen.sh
  ./configure --prefix=/usr --disable-static
  make
}

package() {
  cd "${_pkgname}"
  make DESTDIR="${pkgdir}" install
}
